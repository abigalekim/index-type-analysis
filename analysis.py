import argparse
import csv
from datetime import datetime
import json
import os
import subprocess
import sys

# File paths (globals)
current_working_dir = os.getcwd()
pg_dist_dir = "pg-15-dist"
pg_data_dir = "pg-15-data"
ext_work_dir = "pgextworkdir"
extn_info_dir = "extn_info"
pg_config_path = current_working_dir + "/" + pg_dist_dir + "/bin/pg_config"
now = datetime.now()
date_time = now.strftime("%m-%d-%Y_%H:%M")
testing_output_dir = "testing-output-" + date_time
postgres_version = "15.3"
default_port_num = 5432
port_num = 5432
exit_flag = False

# Load extension database
extn_files = os.listdir(current_working_dir + "/" + extn_info_dir)
extn_db = {}
for file in extn_files:
  extn_info_file = open(current_working_dir + "/" + extn_info_dir + "/" + file, "r")
  extn_info_json = json.load(extn_info_file)
  key = os.path.splitext(file)[0]
  extn_db[key] = extn_info_json

# Postgres helpers

def init_db():
  # Run initdb
  print("Running initdb...")
  subprocess.run("./" + pg_dist_dir +  "/bin/initdb -D " + pg_data_dir, shell=True, cwd=current_working_dir)

def start_postgres():
  # Run Postgres database
  # pg-15-dist/bin/pg_ctl -D pg-15-data -l logfile start
  print("Starting Postgres...")
  subprocess.run("./" + pg_dist_dir + "/bin/pg_ctl -D " + pg_data_dir + " -l logfile start", cwd=current_working_dir, shell=True)

def stop_postgres():
  print("Stopping Postgres...")
  subprocess.run("./" + pg_dist_dir + "/bin/pg_ctl -D " + pg_data_dir + " -l logfile stop", cwd=current_working_dir, shell=True)

def single_cleanup():
  print("Removing data directory...")
  subprocess.run("rm -rf " + pg_data_dir, cwd=current_working_dir, shell=True)

def type_table_setup(type_extn):
  subprocess.run("./pg-15-dist/bin/psql -U abigalek -d postgres -f type_sql/" + type_extn + ".sql", cwd=current_working_dir, shell=True)

def write_into_preload(extn_list):
  postgres_conf = open("./" + pg_data_dir + "/postgresql.conf", "a")
  extns_to_preload = []
  for extn in extn_list:
    extn_entry = extn_db[extn]
    if "no_preload" not in extn_entry:
      extns_to_preload.append(extn)

  shared_preload_lib_str = ','.join(extns_to_preload)
  postgres_conf.write("shared_preload_libraries = '" + shared_preload_lib_str + "'" + "\n")

def single_testing(type_extn, index_extn):
  print("Testing type " + type_extn + " and index " + index_extn)
  init_db()
  write_into_preload([type_extn, index_extn])
  start_postgres()
  type_table_setup(type_extn)

  compatibility = True

  type_entry = extn_db[type_extn]
  udt_field = type_entry["udt_field"]
  index_entry = extn_db[index_extn]
  index_name = index_entry["index_name"]
  create_extn_name = index_entry["create_extn_name"]
  create_extn_command = "CREATE EXTENSION IF NOT EXISTS " + create_extn_name + ";"
  subprocess.run("./pg-15-dist/bin/psql -U abigalek -d postgres -c \"" + create_extn_command + "\"", cwd=current_working_dir, shell=True)

  combined_idx_name = type_extn + "_" + index_extn + "_index"
  sql_command = "CREATE INDEX " + combined_idx_name + " ON " + type_extn + "_table USING " + index_name + "(" + udt_field + ");"
  test_proc = subprocess.run("./pg-15-dist/bin/psql -U abigalek -d postgres -c \"" + sql_command + "\"", cwd=current_working_dir, shell=True, capture_output=True)
  test_err = test_proc.stderr.decode()
  if "ERROR:" in test_err:
    compatibility = False
    failure_file_name = type_extn + "_" + index_extn + ".txt"
    subprocess.run("touch " + testing_output_dir + "/" + failure_file_name, cwd=current_working_dir, shell=True)
    failure_file = open(testing_output_dir + "/" + failure_file_name, "w")
    failure_file.write(test_err)

  stop_postgres()
  single_cleanup()

  return compatibility

def initial_setup():
  subprocess.run("mkdir " + testing_output_dir, cwd=current_working_dir, shell=True)

if __name__ == '__main__':
  initial_setup()
  type_list = []
  index_list = []
  for extn in extn_db.keys():
    extn_entry = extn_db[extn]
    if "index_name" in extn_entry:
      index_list.append(extn)
    elif "udt_field" in extn_entry:
      type_list.append(extn)

  result_file = open("results.csv", "w")
  result_csv = csv.writer(result_file)
  result_csv.writerow(["Type", "Index", "Compatible"])

  for typ in type_list:
    for idx in index_list:
      if typ == idx:
        continue
      else:
        result = single_testing(typ, idx)
        result_csv.writerow([typ, idx, str(result)])
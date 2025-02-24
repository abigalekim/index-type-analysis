# PostgreSQL Index Type Analysis
Basic testing of compatibility of different indexes and types in PostgreSQL version 15.3.

# Specifications
This code runs on a machine with Ubuntu 22.04. Compatibility with other OSes is not supported.

In order for this script to work, you need to install a PostgreSQL 15.3 distribution with all contrib extensions in `PATH_TO_REPO/pg-15-dist`. To do this:
```bash
wget https://ftp.postgresql.org/pub/source/v15.3/postgresql-15.3.tar.gz
tar -xvf postgresql-15.3.tar.gz
cd postgresql-15.3
./configure --prefix=PATH_TO_REPO/pg-15-dist
make world-bin -j8
make install-world-bin -j8
```

# Script
To run this script, `python3 analysis.py` should work. The output of this script is a spreadsheet with the compatibility results.

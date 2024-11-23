imcs doesn't work

make USE_PGXS=1 PG_CONFIG=/home/abigalek/index-type-analysis/pg-15-dist/bin/pg_config -j8

imcs: bug when you just randomly shove strings into imcs 
postgres=# SELECT cs_const('hello');
server closed the connection unexpectedly
        This probably means the server terminated abnormally
        before or while processing the request.
The connection to the server was lost. Attempting reset: Failed.
The connection to the server was lost. Attempting reset: Failed.
!?> \quit

no time to deal with either citus or timescale

pg_trgm: has a type, used for GIST index, does not implement a to function :,)
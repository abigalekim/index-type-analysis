CREATE EXTENSION IF NOT EXISTS prefix;

create table tst ( pref prefix_range );

insert into tst
     select trim(to_char(i, '00000'))
       from generate_series(1, 99999) as i;

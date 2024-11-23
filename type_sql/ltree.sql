CREATE EXTENSION IF NOT EXISTS ltree;

-- Create the table with an ltree type column
CREATE TABLE ltree_table (
    id SERIAL PRIMARY KEY,  -- Adding a primary key for the table
    ltree_value ltree
);

-- Insert 50 tuples with valid ltree values
INSERT INTO ltree_table (ltree_value) VALUES
(''::ltree),
('1'::ltree),
('1.2'::ltree),
('1.2._3'::ltree),
('a'::ltree),
('a.b'::ltree),
('a.b.c'::ltree),
('a.b.c.d'::ltree),
('x'::ltree),
('x.y'::ltree),
('x.y.z'::ltree),
('x.y.z._1'::ltree),
('x.y.z._5'::ltree),
('root'::ltree),
('root.child'::ltree),
('root.child.subchild'::ltree),
('root.child.subchild.grandchild'::ltree),
('top'::ltree),
('top.middle.bottom'::ltree),
('top.middle.bottom.end'::ltree),
('level1'::ltree),
('level1.level2'::ltree),
('level1.level2.level3'::ltree),
('level1.level2.level3.level4'::ltree),
('home'::ltree),
('home.kitchen'::ltree),
('home.kitchen.dining'::ltree),
('home.kitchen.dining.table'::ltree),
('root.branch'::ltree),
('root.branch.leaf'::ltree),
('root.branch.leaf.end'::ltree),
('office'::ltree),
('office.floor1'::ltree),
('office.floor1.room1'::ltree),
('office.floor1.room1.desk'::ltree),
('server'::ltree),
('server.rack'::ltree),
('server.rack.slot'::ltree),
('server.rack.slot.1'::ltree),
('user'::ltree),
('user.name'::ltree),
('user.name.surname'::ltree),
('user.name.surname.nickname'::ltree),
('company'::ltree),
('company.department'::ltree),
('company.department.team'::ltree),
('company.department.team.member'::ltree);

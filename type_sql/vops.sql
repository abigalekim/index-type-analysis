CREATE EXTENSION IF NOT EXISTS vops;

-- Ensure the vops_int8 type is available in your PostgreSQL instance.
-- Assuming vops_int8 is a user-defined type with an input function that takes a cstring.

-- Create the table with the vops_int8 type and an integer data field
CREATE TABLE vops_table (
    id SERIAL PRIMARY KEY,  -- Adding a primary key for the table
    vops_value vops_int8,   -- vops_int8 field
    data INT                -- data field of type INT
);

-- Insert 50 tuples with vops_int8 values and integer data
INSERT INTO vops_table (vops_value, data) VALUES
('1234567890123456789'::vops_int8, 1),    -- Insert as vops_int8
('-987654321012345678'::vops_int8, 2),
('1122334455667788999'::vops_int8, 3),
('-223344556677889900'::vops_int8, 4),
('1000000000000000000'::vops_int8, 5),
('-1000000000000000000'::vops_int8, 6),
('9876543210987654321'::vops_int8, 7),
('-1234567890123456789'::vops_int8, 8),
('1020304050607080909'::vops_int8, 9),
('-1020304050607080909'::vops_int8, 10),
('9999999999999999999'::vops_int8, 11),
('-9999999999999999999'::vops_int8, 12),
('2147483647000000000'::vops_int8, 13),
('-2147483647000000000'::vops_int8, 14),
('5678901234567890123'::vops_int8, 15),
('-5678901234567890123'::vops_int8, 16),
('1234567899876543210'::vops_int8, 17),
('-1234567899876543210'::vops_int8, 18),
('1112223334445556666'::vops_int8, 19),
('-1112223334445556666'::vops_int8, 20),
('2223334445556667777'::vops_int8, 21),
('-2223334445556667777'::vops_int8, 22),
('3334445556667778888'::vops_int8, 23),
('-3334445556667778888'::vops_int8, 24),
('4445556667778889999'::vops_int8, 25),
('-4445556667778889999'::vops_int8, 26),
('5556667778889991111'::vops_int8, 27),
('-5556667778889991111'::vops_int8, 28),
('6667778889991112222'::vops_int8, 29),
('-6667778889991112222'::vops_int8, 30),
('7778889991112223333'::vops_int8, 31),
('-7778889991112223333'::vops_int8, 32),
('8889991112223334444'::vops_int8, 33),
('-8889991112223334444'::vops_int8, 34),
('9991112223334445555'::vops_int8, 35),
('-9991112223334445555'::vops_int8, 36),
('1001001001001001000'::vops_int8, 37),
('-1001001001001001000'::vops_int8, 38),
('2002002002002002000'::vops_int8, 39),
('-2002002002002002000'::vops_int8, 40),
('3003003003003003000'::vops_int8, 41),
('-3003003003003003000'::vops_int8, 42),
('4004004004004004000'::vops_int8, 43),
('-4004004004004004000'::vops_int8, 44),
('5005005005005005000'::vops_int8, 45),
('-5005005005005005000'::vops_int8, 46),
('6006006006006006000'::vops_int8, 47),
('-6006006006006006000'::vops_int8, 48),
('7007007007007007000'::vops_int8, 49),
('-7007007007007007000'::vops_int8, 50);


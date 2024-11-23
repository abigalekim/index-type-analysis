CREATE EXTENSION IF NOT EXISTS seg;

-- Create the table with seg type and a data field (integer)
CREATE TABLE seg_table (
    id SERIAL PRIMARY KEY,  -- Adding a primary key for the table
    seg_value seg,
    data INT
);

-- Insert 50 tuples with seg values and integer data
INSERT INTO seg_table (seg_value, data) VALUES
('1'::seg, 1),
('-1'::seg, 2),
('1.0'::seg, 3),
('-1.0'::seg, 4),
('1e7'::seg, 5),
('-1e7'::seg, 6),
('1.0e7'::seg, 7),
('-1.0e7'::seg, 8),
('1e+7'::seg, 9),
('-1e+7'::seg, 10),
('1.0e+7'::seg, 11),
('-1.0e+7'::seg, 12),
('1e-7'::seg, 13),
('-1e-7'::seg, 14),
('1.0e-7'::seg, 15),
('-1.0e-7'::seg, 16),
('2e-6'::seg, 17),
('2e-5'::seg, 18),
('2e-4'::seg, 19),
('2e-3'::seg, 20),
('2e-2'::seg, 21),
('2e-1'::seg, 22),
('2e0'::seg, 23),
('2e+0'::seg, 24),
('2e+1'::seg, 25),
('2e+2'::seg, 26),
('2e+3'::seg, 27),
('2e+4'::seg, 28),
('2e+5'::seg, 29),
('2e+6'::seg, 30),
('-2e-6'::seg, 31),
('-2e-5'::seg, 32),
('-2e-4'::seg, 33),
('-2e-3'::seg, 34),
('-2e-2'::seg, 35),
('-2e-1'::seg, 36),
('-2e0'::seg, 37),
('-2e+0'::seg, 38),
('-2e+1'::seg, 39),
('-2e+2'::seg, 40),
('-2e+3'::seg, 41),
('-2e+4'::seg, 42),
('-2e+5'::seg, 43),
('-2e+6'::seg, 44),
('1.23'::seg, 45),
('3.45'::seg, 46),
('6.78'::seg, 47),
('9.01'::seg, 48),
('10e3'::seg, 49),
('-10e3'::seg, 50);
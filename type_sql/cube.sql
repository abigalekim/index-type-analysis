-- Enable the cube extension
CREATE EXTENSION IF NOT EXISTS cube;

-- Create a table for color points in 4D space (RGB + brightness)
CREATE TABLE cube_table (
    id SERIAL PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    color_category VARCHAR(30),
    rgb_brightness cube, -- Stores (R,G,B,Brightness) as 4D coordinates
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert 50 color points with their RGB values (0-255) and brightness (0-100)
INSERT INTO cube_table (color_name, color_category, rgb_brightness) VALUES
    ('Pure Red', 'Primary', '(255,0,0,100)'),
    ('Pure Green', 'Primary', '(0,255,0,100)'),
    ('Pure Blue', 'Primary', '(0,0,255,100)'),
    ('White', 'Neutral', '(255,255,255,100)'),
    ('Black', 'Neutral', '(0,0,0,0)'),
    ('Gray', 'Neutral', '(128,128,128,50)'),
    ('Yellow', 'Secondary', '(255,255,0,90)'),
    ('Cyan', 'Secondary', '(0,255,255,85)'),
    ('Magenta', 'Secondary', '(255,0,255,80)'),
    ('Orange', 'Secondary', '(255,165,0,75)'),
    ('Purple', 'Secondary', '(128,0,128,60)'),
    ('Pink', 'Pastel', '(255,192,203,80)'),
    ('Light Blue', 'Pastel', '(173,216,230,75)'),
    ('Mint Green', 'Pastel', '(152,255,152,80)'),
    ('Lavender', 'Pastel', '(230,230,250,85)'),
    ('Peach', 'Pastel', '(255,218,185,75)'),
    ('Crimson', 'Red', '(220,20,60,70)'),
    ('Dark Red', 'Red', '(139,0,0,40)'),
    ('Maroon', 'Red', '(128,0,0,35)'),
    ('Coral', 'Red', '(255,127,80,75)'),
    ('Forest Green', 'Green', '(34,139,34,45)'),
    ('Lime Green', 'Green', '(50,205,50,80)'),
    ('Olive', 'Green', '(128,128,0,40)'),
    ('Sage', 'Green', '(176,208,176,65)'),
    ('Navy Blue', 'Blue', '(0,0,128,30)'),
    ('Royal Blue', 'Blue', '(65,105,225,65)'),
    ('Sky Blue', 'Blue', '(135,206,235,80)'),
    ('Turquoise', 'Blue', '(64,224,208,75)'),
    ('Brown', 'Earth', '(165,42,42,40)'),
    ('Tan', 'Earth', '(210,180,140,60)'),
    ('Beige', 'Earth', '(245,245,220,85)'),
    ('Khaki', 'Earth', '(240,230,140,70)'),
    ('Gold', 'Metallic', '(255,215,0,85)'),
    ('Silver', 'Metallic', '(192,192,192,75)'),
    ('Bronze', 'Metallic', '(205,127,50,60)'),
    ('Platinum', 'Metallic', '(229,228,226,90)'),
    ('Hot Pink', 'Vibrant', '(255,105,180,85)'),
    ('Electric Blue', 'Vibrant', '(125,249,255,95)'),
    ('Neon Green', 'Vibrant', '(57,255,20,100)'),
    ('Bright Purple', 'Vibrant', '(255,0,255,90)'),
    ('Wine Red', 'Dark', '(114,47,55,30)'),
    ('Charcoal', 'Dark', '(54,69,79,25)'),
    ('Midnight Blue', 'Dark', '(25,25,112,20)'),
    ('Dark Forest', 'Dark', '(43,51,24,15)'),
    ('Salmon', 'Pink', '(250,128,114,70)'),
    ('Rose', 'Pink', '(255,0,127,65)'),
    ('Blush', 'Pink', '(255,111,207,75)'),
    ('Mauve', 'Pink', '(224,176,255,70)'),
    ('Rust', 'Orange', '(183,65,14,45)'),
    ('Burnt Orange', 'Orange', '(204,85,0,50)');
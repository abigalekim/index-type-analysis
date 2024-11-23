-- Enable the hstore extension
CREATE EXTENSION IF NOT EXISTS hstore;

-- Create a table with an hstore column
CREATE TABLE hstore_table (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    attributes hstore
);

-- Insert 50 sample products with varied attributes
INSERT INTO hstore_table (name, attributes) VALUES
    -- Electronics
    ('Laptop Pro 13', 'brand=>Dell, color=>silver, ram=>16GB, storage=>512GB, processor=>Intel_i7, price=>1299.99, weight=>1.4kg'),
    ('Laptop Pro 15', 'brand=>Dell, color=>space_gray, ram=>32GB, storage=>1TB, processor=>Intel_i9, price=>1799.99, weight=>1.6kg'),
    ('Laptop Air', 'brand=>Apple, color=>gold, ram=>8GB, storage=>256GB, processor=>M1, price=>999.99, weight=>1.29kg'),
    ('Smartphone X', 'brand=>Samsung, color=>black, storage=>128GB, screen=>6.7inch, camera=>108MP, price=>899.99'),
    ('Smartphone Y', 'brand=>Apple, color=>midnight, storage=>256GB, screen=>6.1inch, camera=>48MP, price=>999.99'),
    ('Tablet Pro', 'brand=>Apple, color=>silver, storage=>128GB, screen=>12.9inch, pencil_support=>true, price=>1099.99'),
    ('Smart Watch', 'brand=>Garmin, color=>black, battery=>14days, water_resistant=>true, price=>399.99'),
    ('Wireless Earbuds', 'brand=>Sony, color=>white, battery=>8h, noise_cancelling=>true, price=>249.99'),
    ('Gaming Console', 'brand=>Sony, color=>white, storage=>825GB, resolution=>4K, price=>499.99'),
    ('Desktop PC', 'brand=>HP, color=>black, ram=>32GB, storage=>2TB, processor=>AMD, price=>1499.99'),
    
    -- Home Appliances
    ('Smart Fridge', 'brand=>Samsung, color=>steel, capacity=>650L, ice_maker=>true, price=>2499.99'),
    ('Washing Machine', 'brand=>LG, color=>white, capacity=>9kg, energy_rating=>A+++, price=>799.99'),
    ('Dishwasher', 'brand=>Bosch, color=>silver, capacity=>14place, noise_level=>44db, price=>699.99'),
    ('Microwave Oven', 'brand=>Panasonic, color=>black, capacity=>32L, power=>1100W, price=>199.99'),
    ('Coffee Maker', 'brand=>Breville, color=>steel, capacity=>2L, pressure=>15bar, price=>599.99'),
    ('Air Purifier', 'brand=>Dyson, color=>white, coverage=>81m2, hepa=>true, price=>499.99'),
    ('Robot Vacuum', 'brand=>iRobot, color=>black, battery=>120min, mapping=>true, price=>399.99'),
    ('Smart TV', 'brand=>LG, color=>black, screen=>65inch, resolution=>4K, price=>1299.99'),
    ('Air Conditioner', 'brand=>Daikin, color=>white, power=>9000BTU, wifi=>true, price=>899.99'),
    ('Water Heater', 'brand=>Rheem, color=>white, capacity=>50G, energy_rating=>A+, price=>499.99'),
    
    -- Furniture
    ('Sofa', 'brand=>IKEA, color=>beige, material=>fabric, seats=>3, price=>699.99'),
    ('Dining Table', 'brand=>Ashley, color=>oak, material=>wood, seats=>6, price=>899.99'),
    ('Office Chair', 'brand=>Herman_Miller, color=>black, material=>mesh, ergonomic=>true, price=>999.99'),
    ('Bed Frame', 'brand=>Casper, color=>gray, material=>metal, size=>queen, price=>799.99'),
    ('Bookshelf', 'brand=>IKEA, color=>white, material=>wood, shelves=>5, price=>199.99'),
    ('Wardrobe', 'brand=>Wayfair, color=>brown, material=>wood, doors=>3, price=>599.99'),
    ('Coffee Table', 'brand=>West_Elm, color=>walnut, material=>wood, storage=>true, price=>399.99'),
    ('TV Stand', 'brand=>Ashley, color=>black, material=>wood, width=>65inch, price=>299.99'),
    ('Dresser', 'brand=>IKEA, color=>white, material=>wood, drawers=>6, price=>399.99'),
    ('Side Table', 'brand=>Article, color=>oak, material=>wood, height=>24inch, price=>149.99'),
    
    -- Kitchen Items
    ('Knife Set', 'brand=>Wusthof, material=>steel, pieces=>7, block=>included, price=>299.99'),
    ('Cookware Set', 'brand=>All-Clad, material=>stainless_steel, pieces=>10, dishwasher_safe=>true, price=>699.99'),
    ('Blender', 'brand=>Vitamix, color=>black, power=>1400W, speeds=>10, price=>499.99'),
    ('Food Processor', 'brand=>Cuisinart, color=>silver, capacity=>14cup, attachments=>5, price=>199.99'),
    ('Stand Mixer', 'brand=>KitchenAid, color=>red, capacity=>5qt, speeds=>10, price=>399.99'),
    ('Toaster', 'brand=>Breville, color=>steel, slots=>4, settings=>6, price=>179.99'),
    ('Rice Cooker', 'brand=>Zojirushi, color=>white, capacity=>5.5cup, functions=>7, price=>199.99'),
    ('Air Fryer', 'brand=>Ninja, color=>black, capacity=>6qt, presets=>6, price=>129.99'),
    ('Food Scale', 'brand=>OXO, color=>steel, capacity=>11lb, precision=>1g, price=>49.99'),
    ('Kettle', 'brand=>Fellow, color=>matte_black, capacity=>1L, temperature_control=>true, price=>149.99'),
    
    -- Outdoor
    ('Grill', 'brand=>Weber, color=>black, fuel=>gas, burners=>3, price=>699.99'),
    ('Patio Set', 'brand=>Hampton_Bay, material=>wicker, pieces=>4, weather_resistant=>true, price=>899.99'),
    ('Lawn Mower', 'brand=>EGO, power=>battery, runtime=>45min, self_propelled=>true, price=>499.99'),
    ('Garden Tools', 'brand=>Fiskars, material=>steel, pieces=>5, warranty=>lifetime, price=>99.99'),
    ('Outdoor Lights', 'brand=>Philips, type=>LED, quantity=>6, solar=>true, price=>79.99'),
    ('Bird Feeder', 'brand=>Droll_Yankees, material=>plastic, capacity=>4lb, squirrel_proof=>true, price=>39.99'),
    ('Fire Pit', 'brand=>Solo_Stove, material=>steel, size=>medium, smokeless=>true, price=>299.99'),
    ('Plant Pots', 'brand=>TerraCotta, material=>clay, size=>12inch, drainage=>true, price=>29.99'),
    ('Umbrella', 'brand=>Sunbrella, color=>navy, size=>9ft, uv_protection=>true, price=>199.99'),
    ('Composting Bin', 'brand=>EPICA, material=>plastic, capacity=>1.3gal, odor_free=>true, price=>49.99');

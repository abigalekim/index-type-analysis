-- Enable the hll extension
CREATE EXTENSION IF NOT EXISTS hll;

-- Create a table for tracking unique visitors
CREATE TABLE hll_table (
    id SERIAL PRIMARY KEY,
    page_path VARCHAR(255) NOT NULL,
    date_bucket DATE NOT NULL,
    visitor_ids hll,  -- HyperLogLog type to store unique visitor IDs
    UNIQUE (page_path, date_bucket)
);

-- Function to generate a hash value for visitor IDs
CREATE OR REPLACE FUNCTION generate_visitor_hash() 
RETURNS INTEGER AS $$
BEGIN
    -- Generate a hash value between 1 and 2^32-1
    RETURN (random() * 2147483647)::integer;
END;
$$ LANGUAGE plpgsql;

-- Helper function to generate HLL from array of values
CREATE OR REPLACE FUNCTION generate_hll_from_visitors(num_visitors INTEGER) 
RETURNS hll AS $$
DECLARE
    visitor_hll hll;
BEGIN
    visitor_hll := hll_empty();
    FOR i IN 1..num_visitors LOOP
        visitor_hll := hll_add(visitor_hll, hll_hash_integer(generate_visitor_hash()));
    END LOOP;
    RETURN visitor_hll;
END;
$$ LANGUAGE plpgsql;

-- Insert sample data for 50 different page/date combinations
INSERT INTO hll_table (page_path, date_bucket, visitor_ids) VALUES
    -- Homepage traffic
    ('/home', '2024-01-01', generate_hll_from_visitors(1500)),
    ('/home', '2024-01-02', generate_hll_from_visitors(1650)),
    ('/home', '2024-01-03', generate_hll_from_visitors(1420)),
    ('/home', '2024-01-04', generate_hll_from_visitors(1580)),
    ('/home', '2024-01-05', generate_hll_from_visitors(2100)),
    
    -- Product pages
    ('/products', '2024-01-01', generate_hll_from_visitors(800)),
    ('/products', '2024-01-02', generate_hll_from_visitors(920)),
    ('/products', '2024-01-03', generate_hll_from_visitors(750)),
    ('/products', '2024-01-04', generate_hll_from_visitors(890)),
    ('/products', '2024-01-05', generate_hll_from_visitors(1200)),
    
    -- Blog posts
    ('/blog/post1', '2024-01-01', generate_hll_from_visitors(300)),
    ('/blog/post1', '2024-01-02', generate_hll_from_visitors(450)),
    ('/blog/post1', '2024-01-03', generate_hll_from_visitors(280)),
    ('/blog/post1', '2024-01-04', generate_hll_from_visitors(320)),
    ('/blog/post1', '2024-01-05', generate_hll_from_visitors(290)),
    
    ('/blog/post2', '2024-01-01', generate_hll_from_visitors(250)),
    ('/blog/post2', '2024-01-02', generate_hll_from_visitors(380)),
    ('/blog/post2', '2024-01-03', generate_hll_from_visitors(420)),
    ('/blog/post2', '2024-01-04', generate_hll_from_visitors(360)),
    ('/blog/post2', '2024-01-05', generate_hll_from_visitors(310)),
    
    -- Documentation pages
    ('/docs/getting-started', '2024-01-01', generate_hll_from_visitors(600)),
    ('/docs/getting-started', '2024-01-02', generate_hll_from_visitors(580)),
    ('/docs/getting-started', '2024-01-03', generate_hll_from_visitors(620)),
    ('/docs/getting-started', '2024-01-04', generate_hll_from_visitors(590)),
    ('/docs/getting-started', '2024-01-05', generate_hll_from_visitors(640)),
    
    ('/docs/api', '2024-01-01', generate_hll_from_visitors(400)),
    ('/docs/api', '2024-01-02', generate_hll_from_visitors(420)),
    ('/docs/api', '2024-01-03', generate_hll_from_visitors(380)),
    ('/docs/api', '2024-01-04', generate_hll_from_visitors(410)),
    ('/docs/api', '2024-01-05', generate_hll_from_visitors(430)),
    
    -- About page
    ('/about', '2024-01-01', generate_hll_from_visitors(200)),
    ('/about', '2024-01-02', generate_hll_from_visitors(180)),
    ('/about', '2024-01-03', generate_hll_from_visitors(220)),
    ('/about', '2024-01-04', generate_hll_from_visitors(190)),
    ('/about', '2024-01-05', generate_hll_from_visitors(210)),
    
    -- Contact page
    ('/contact', '2024-01-01', generate_hll_from_visitors(150)),
    ('/contact', '2024-01-02', generate_hll_from_visitors(140)),
    ('/contact', '2024-01-03', generate_hll_from_visitors(160)),
    ('/contact', '2024-01-04', generate_hll_from_visitors(145)),
    ('/contact', '2024-01-05', generate_hll_from_visitors(155)),
    
    -- Feature pages
    ('/features/basic', '2024-01-01', generate_hll_from_visitors(350)),
    ('/features/basic', '2024-01-02', generate_hll_from_visitors(380)),
    ('/features/basic', '2024-01-03', generate_hll_from_visitors(340)),
    ('/features/basic', '2024-01-04', generate_hll_from_visitors(360)),
    ('/features/basic', '2024-01-05', generate_hll_from_visitors(370)),
    
    ('/features/pro', '2024-01-01', generate_hll_from_visitors(280)),
    ('/features/pro', '2024-01-02', generate_hll_from_visitors(300)),
    ('/features/pro', '2024-01-03', generate_hll_from_visitors(270)),
    ('/features/pro', '2024-01-04', generate_hll_from_visitors(290)),
    ('/features/pro', '2024-01-05', generate_hll_from_visitors(310));
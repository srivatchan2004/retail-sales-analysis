-- 
-- RETAIL SALES ANALYSIS — Schema & Sample Data
-- Author: Srivatchan

-- Drop tables if they exist (for clean re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- TABLE: customers
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city          VARCHAR(50),
    state         VARCHAR(50),
    region        VARCHAR(20)
);

INSERT INTO customers VALUES
(1,  'Arjun Sharma',    'Chennai',   'Tamil Nadu',      'South'),
(2,  'Priya Nair',      'Bangalore', 'Karnataka',       'South'),
(3,  'Rahul Verma',     'Mumbai',    'Maharashtra',     'West'),
(4,  'Sneha Reddy',     'Hyderabad', 'Telangana',       'South'),
(5,  'Kiran Patel',     'Ahmedabad', 'Gujarat',         'West'),
(6,  'Deepa Iyer',      'Chennai',   'Tamil Nadu',      'South'),
(7,  'Amit Singh',      'Delhi',     'Delhi',           'North'),
(8,  'Pooja Mehta',     'Pune',      'Maharashtra',     'West'),
(9,  'Vijay Kumar',     'Kolkata',   'West Bengal',     'East'),
(10, 'Anita Das',       'Bhubaneswar','Odisha',         'East'),
(11, 'Ravi Chandran',   'Coimbatore','Tamil Nadu',      'South'),
(12, 'Meena Pillai',    'Kochi',     'Kerala',          'South'),
(13, 'Suresh Gupta',    'Jaipur',    'Rajasthan',       'North'),
(14, 'Lakshmi Rao',     'Vizag',     'Andhra Pradesh',  'South'),
(15, 'Naveen Joshi',    'Indore',    'Madhya Pradesh',  'Central');

-- TABLE: products
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    category     VARCHAR(50),
    unit_price   DECIMAL(10,2)
);

INSERT INTO products VALUES
(1,  'Laptop Pro 15',        'Electronics',  75000.00),
(2,  'Wireless Headphones',  'Electronics',  3500.00),
(3,  'Office Chair',         'Furniture',    12000.00),
(4,  'Standing Desk',        'Furniture',    25000.00),
(5,  'Python Programming Book','Books',       799.00),
(6,  'Data Science Handbook','Books',         999.00),
(7,  'USB-C Hub',            'Electronics',  2200.00),
(8,  'Mechanical Keyboard',  'Electronics',  4500.00),
(9,  'Monitor 27 inch',      'Electronics',  22000.00),
(10, 'Bookshelf',            'Furniture',    8000.00),
(11, 'Webcam HD',            'Electronics',  3200.00),
(12, 'Desk Lamp',            'Furniture',    1500.00),
(13, 'novel',                'Books',         649.00),
(14, 'Mousepad XL',          'Accessories',   599.00),
(15, 'Laptop Stand',         'Accessories',  1800.00);

-- TABLE: orders
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date  DATE,
    status      VARCHAR(20)
);

INSERT INTO orders VALUES
(1001, 1,  '2024-01-05', 'Delivered'),
(1002, 2,  '2024-01-12', 'Delivered'),
(1003, 3,  '2024-01-18', 'Delivered'),
(1004, 4,  '2024-02-02', 'Delivered'),
(1005, 5,  '2024-02-14', 'Delivered'),
(1006, 6,  '2024-02-20', 'Delivered'),
(1007, 7,  '2024-03-03', 'Delivered'),
(1008, 8,  '2024-03-15', 'Delivered'),
(1009, 9,  '2024-03-22', 'Delivered'),
(1010, 10, '2024-04-01', 'Delivered'),
(1011, 1,  '2024-04-10', 'Delivered'),
(1012, 2,  '2024-04-18', 'Delivered'),
(1013, 11, '2024-05-05', 'Delivered'),
(1014, 12, '2024-05-12', 'Delivered'),
(1015, 3,  '2024-05-20', 'Delivered'),
(1016, 13, '2024-06-03', 'Delivered'),
(1017, 14, '2024-06-11', 'Delivered'),
(1018, 4,  '2024-06-19', 'Delivered'),
(1019, 15, '2024-07-02', 'Delivered'),
(1020, 5,  '2024-07-15', 'Delivered'),
(1021, 6,  '2024-07-23', 'Delivered'),
(1022, 7,  '2024-08-05', 'Delivered'),
(1023, 8,  '2024-08-14', 'Delivered'),
(1024, 9,  '2024-08-22', 'Delivered'),
(1025, 10, '2024-09-03', 'Delivered'),
(1026, 11, '2024-09-12', 'Delivered'),
(1027, 1,  '2024-09-20', 'Delivered'),
(1028, 2,  '2024-10-04', 'Delivered'),
(1029, 12, '2024-10-13', 'Delivered'),
(1030, 13, '2024-10-21', 'Delivered'),
(1031, 3,  '2024-11-02', 'Delivered'),
(1032, 14, '2024-11-11', 'Delivered'),
(1033, 15, '2024-11-19', 'Delivered'),
(1034, 4,  '2024-12-03', 'Delivered'),
(1035, 5,  '2024-12-12', 'Delivered'),
(1036, 6,  '2024-12-20', 'Delivered');

-- TABLE: order_items
CREATE TABLE order_items (
    item_id    INT PRIMARY KEY,
    order_id   INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity   INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO order_items VALUES
(1,  1001, 1,  1, 75000.00),
(2,  1001, 2,  2, 3500.00),
(3,  1002, 9,  1, 22000.00),
(4,  1002, 8,  1, 4500.00),
(5,  1003, 3,  2, 12000.00),
(6,  1003, 4,  1, 25000.00),
(7,  1004, 1,  1, 75000.00),
(8,  1004, 15, 2, 1800.00),
(9,  1005, 7,  3, 2200.00),
(10, 1005, 14, 2, 599.00),
(11, 1006, 2,  1, 3500.00),
(12, 1006, 11, 1, 3200.00),
(13, 1007, 9,  2, 22000.00),
(14, 1007, 3,  1, 12000.00),
(15, 1008, 5,  3, 799.00),
(16, 1008, 6,  2, 999.00),
(17, 1009, 1,  1, 75000.00),
(18, 1009, 7,  2, 2200.00),
(19, 1010, 4,  1, 25000.00),
(20, 1010, 10, 1, 8000.00),
(21, 1011, 8,  2, 4500.00),
(22, 1011, 14, 3, 599.00),
(23, 1012, 9,  1, 22000.00),
(24, 1012, 15, 1, 1800.00),
(25, 1013, 2,  2, 3500.00),
(26, 1013, 11, 1, 3200.00),
(27, 1014, 1,  1, 75000.00),
(28, 1014, 12, 2, 1500.00),
(29, 1015, 3,  1, 12000.00),
(30, 1015, 5,  4, 799.00),
(31, 1016, 6,  3, 999.00),
(32, 1016, 13, 5, 649.00),
(33, 1017, 9,  1, 22000.00),
(34, 1017, 7,  2, 2200.00),
(35, 1018, 1,  1, 75000.00),
(36, 1018, 14, 4, 599.00),
(37, 1019, 4,  2, 25000.00),
(38, 1019, 10, 1, 8000.00),
(39, 1020, 8,  1, 4500.00),
(40, 1020, 15, 2, 1800.00),
(41, 1021, 2,  3, 3500.00),
(42, 1021, 11, 2, 3200.00),
(43, 1022, 9,  1, 22000.00),
(44, 1022, 3,  1, 12000.00),
(45, 1023, 5,  2, 799.00),
(46, 1023, 6,  1, 999.00),
(47, 1024, 1,  1, 75000.00),
(48, 1024, 8,  1, 4500.00),
(49, 1025, 4,  1, 25000.00),
(50, 1025, 12, 3, 1500.00),
(51, 1026, 7,  2, 2200.00),
(52, 1026, 14, 5, 599.00),
(53, 1027, 9,  2, 22000.00),
(54, 1027, 15, 1, 1800.00),
(55, 1028, 1,  1, 75000.00),
(56, 1028, 2,  2, 3500.00),
(57, 1029, 3,  2, 12000.00),
(58, 1029, 10, 1, 8000.00),
(59, 1030, 6,  4, 999.00),
(60, 1030, 13, 3, 649.00),
(61, 1031, 9,  1, 22000.00),
(62, 1031, 7,  3, 2200.00),
(63, 1032, 1,  1, 75000.00),
(64, 1032, 14, 2, 599.00),
(65, 1033, 4,  1, 25000.00),
(66, 1033, 5,  2, 799.00),
(67, 1034, 8,  2, 4500.00),
(68, 1034, 11, 1, 3200.00),
(69, 1035, 2,  1, 3500.00),
(70, 1035, 15, 3, 1800.00),
(71, 1036, 9,  1, 22000.00),
(72, 1036, 12, 2, 1500.00);

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 创建客户表
CREATE TABLE IF NOT EXISTS customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  image_url VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 创建发票表
CREATE TABLE IF NOT EXISTS invoices (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  amount INTEGER NOT NULL,
  status VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 创建收入表
CREATE TABLE IF NOT EXISTS revenue (
  month VARCHAR(4) NOT NULL,
  revenue INTEGER NOT NULL
);

-- 插入一些测试数据
INSERT INTO customers (name, email, image_url) VALUES
  ('Delba de Oliveira', 'delba@oliveira.com', '/customers/delba-de-oliveira.png'),
  ('Lee Robinson', 'lee@robinson.com', '/customers/lee-robinson.png'),
  ('Hector Simpson', 'hector@simpson.com', '/customers/hector-simpson.png'),
  ('Steven Tey', 'steven@tey.com', '/customers/steven-tey.png'),
  ('Steph Dietz', 'steph@dietz.com', '/customers/steph-dietz.png');

INSERT INTO invoices (customer_id, amount, status, date) VALUES
  (1, 15795, 'pending', '2023-12-16'),
  (2, 20348, 'pending', '2023-11-14'),
  (3, 3040, 'paid', '2023-10-29'),
  (4, 44800, 'paid', '2023-09-10'),
  (5, 34577, 'pending', '2023-08-05');

INSERT INTO revenue (month, revenue) VALUES
  ('Jan', 2000),
  ('Feb', 1800),
  ('Mar', 2200),
  ('Apr', 2500),
  ('May', 2300),
  ('Jun', 3200),
  ('Jul', 3500),
  ('Aug', 3700),
  ('Sep', 4900),
  ('Oct', 3800),
  ('Nov', 4000),
  ('Dec', 4800); 
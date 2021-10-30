CREATE TABLE orders(
id SERIAL PRIMARY KEY,
time TIMESTAMP,
user_id INTEGER REFERENCES users (id),
total DECIMAL(9,2),
delivery_address VARCHAR(60),
contents VARCHAR(60)
);
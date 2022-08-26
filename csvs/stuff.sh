sleep 5

psql -h postgres_source -p 5432 -U admin demo_source -c 'CREATE TABLE raw_customers(id SERIAL, first_name VARCHAR(50), last_name VARCHAR(50), PRIMARY KEY (id))'

psql -h postgres_source -p 5432 -U admin demo_source -c "COPY raw_customers(id, first_name, last_name) FROM '/csvs/raw_customers.csv' DELIMITER ',' CSV HEADER;"
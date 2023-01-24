--CREATE DATABASE
CREATE DATABASE medical_store;

-- CREATE TABLE PATIENTS
CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE
);

-- CREATE TABLE MEDICAL STORES
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  FOREIGN KEY patient_id REFERENCES patients(id)
);

-- CREATE TABLE TREATMENTS
CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255)
);

-- CREATE TABLE MEDICAL_TREATMENTS
CREATE TABLE medical_histories_treatments(
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
);

-- CREATE TABLE INVOICE ITEMS
CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

-- CREATE TABLE INVOICES
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

-- CREATE INDEX FOR MEDICAL HISTORIES
CREATE INDEX medical_histories_patients_id_asc ON medical_histories(patient_id ASC);

-- CREATE INDEX FOR MEDICAL HISTORIES INVOICES
CREATE INDEX invoices_medical_history_id_asc ON invoices(medical_history_id ASC);

-- CREATE INDEX FOR INVOICE ITEMS INVOICES
CREATE INDEX invoice_items_invoice_id_asc ON invoice_items(invoice_id ASC);

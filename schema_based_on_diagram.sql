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

-- 
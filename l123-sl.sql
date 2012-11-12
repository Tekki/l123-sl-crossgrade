-- Ledger123 to SQL-Ledger Crossgrade Script
--
-- Tekki 2011-2012

-- Restore the original table structure
ALTER TABLE acc_trans DROP COLUMN entry_id;

ALTER TABLE inventory DROP COLUMN department_id;
ALTER TABLE inventory DROP COLUMN warehouse_id2;
ALTER TABLE inventory DROP COLUMN serialnumber;
ALTER TABLE inventory DROP COLUMN itemnotes;
ALTER TABLE inventory DROP COLUMN cost;
ALTER TABLE inventory DROP COLUMN linetype;
ALTER TABLE inventory DROP COLUMN description;
ALTER TABLE inventory DROP COLUMN invoice_id;
ALTER TABLE inventory DROP COLUMN cogs;

ALTER TABLE invoice DROP COLUMN transdate;
ALTER TABLE invoice DROP COLUMN lastcost;
ALTER TABLE invoice DROP COLUMN warehouse_id;
ALTER TABLE invoice DROP COLUMN cogs;

ALTER TABLE chart DROP COLUMN allow_gl;

ALTER TABLE customer DROP COLUMN department_id;
ALTER TABLE vendor DROP COLUMN department_id;

-- Drop additional tables and sequences

DROP TABLE trf;
DROP TABLE invoicetax;
DROP TABLE build;
DROP TABLE customercart;
DROP TABLE customerlogin;
DROP TABLE partsattr;
DROP TABLE fifo;

DROP SEQUENCE entry_id;
DROP SEQUENCE customerloginid;

-- Drop views from Community Version

DROP VIEW IF EXISTS v_customers;
DROP VIEW IF EXISTS v_customers_all;
DROP VIEW IF EXISTS v_customer_taxes;
DROP VIEW IF EXISTS v_customer_taxaccounts;
DROP VIEW IF EXISTS v_vendors;
DROP VIEW IF EXISTS v_vendors_all;

-- Set database version

UPDATE defaults SET fldvalue = '2.8.10' WHERE fldname = 'version' AND fldvalue = '2.8.12';

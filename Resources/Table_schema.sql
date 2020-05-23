-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/EEUwWG
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

DROP TABLE IF EXISTS walmart_stores;
DROP TABLE IF EXISTS store_counts;
DROP TABLE IF EXISTS final_df;

CREATE TABLE walmart_stores (
    zipcode INT   NOT NULL,
    store_count INT   NOT NULL,
    population DECIMAL   NOT NULL,
    poverty_count DECIMAL   NOT NULL,
    poverty_rate DECIMAL   NOT NULL
);

CREATE TABLE store_counts (
    zipcode INT   NOT NULL,
    store_count INT   NOT NULL,
    CONSTRAINT pk_store_counts PRIMARY KEY (
        zipcode
     )
);

CREATE TABLE final_df (
    zipcode INT   NOT NULL,
    store_count INT   NOT NULL,
    population DECIMAL   NOT NULL,
    poverty_count DECIMAL   NOT NULL,
    poverty_rate DECIMAL   NOT NULL,
    latitude DECIMAL   NOT NULL,
    longitude DECIMAL   NOT NULL
);

ALTER TABLE walmart_stores ADD CONSTRAINT fk_walmart_stores_zipcode FOREIGN KEY(zipcode)
REFERENCES store_counts (zipcode);

ALTER TABLE final_df ADD CONSTRAINT fk_final_df_zipcode FOREIGN KEY(zipcode)
REFERENCES store_counts (zipcode);


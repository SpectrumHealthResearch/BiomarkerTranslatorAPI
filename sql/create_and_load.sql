DROP DATABASE IF EXISTS biomarker;
CREATE SCHEMA IF NOT EXISTS biomarker DEFAULT CHARACTER SET utf8;
USE biomarker;

DROP TABLE IF EXISTS biomarker;
DROP TABLE IF EXISTS disease;
DROP TABLE IF EXISTS gene;
DROP TABLE IF EXISTS curation_source;

-- -----------------------------------------------------
-- Biomarker
-- -----------------------------------------------------
-- pass

-- -----------------------------------------------------
-- Disease
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS disease (
    curie VARCHAR(50) NOT NULL,
    disease VARCHAR(500),
    PRIMARY KEY (curie)
);

LOAD DATA LOCAL INFILE 'data/bmrec_disease.tsv' 
INTO TABLE disease
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Drug Target
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS drug (
    curie VARCHAR(20) NOT NULL,
    drug VARCHAR(500),
    target VARCHAR(500),
    PRIMARY KEY (curie)
);

LOAD DATA LOCAL INFILE 'data/bmrec_drug_target.tsv' 
INTO TABLE drug
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Gene
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gene (
    curie VARCHAR(50) NOT NULL,
    gene VARCHAR(20),
    gene_att VARCHAR(50),
    att_val VARCHAR(50),
    PRIMARY KEY (curie)
);

LOAD DATA LOCAL INFILE 'data/bmrec_gene.tsv' 
INTO TABLE gene
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- -----------------------------------------------------
-- Curation Source
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS curation_source (
    curie VARCHAR(50) NOT NULL,
    curation_source VARCHAR(50),
    PRIMARY KEY (curie)
);

LOAD DATA LOCAL INFILE 'data/bmrec.tsv' 
INTO TABLE curation_source
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

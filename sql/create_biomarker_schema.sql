-- -----------------------------------------------------
-- SCHEMA biomarker
-- -----------------------------------------------------
DROP DATABASE IF EXISTS biomarker;
CREATE SCHEMA IF NOT EXISTS biomarker DEFAULT CHARACTER SET utf8;
USE biomarker;

DROP TABLE IF EXISTS biomarker;
DROP TABLE IF EXISTS biomarker_alias;
DROP TABLE IF EXISTS disease;
DROP TABLE IF EXISTS disease_alias;
DROP TABLE IF EXISTS drug;
DROP TABLE IF EXISTS drug_alias;
DROP TABLE IF EXISTS edges;
DROP TABLE IF EXISTS entity;

-- -----------------------------------------------------
-- Biomarker
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS biomarker (
    curie VARCHAR(20) NOT NULL,
    symbol VARCHAR(20),
    type VARCHAR(50),
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS biomarker_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_biomarker FOREIGN KEY (curie)
        REFERENCES biomarker (curie)
);

-- -----------------------------------------------------
-- Disease
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS disease (
    curie VARCHAR(20) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS disease_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_disease FOREIGN KEY (curie)
        REFERENCES disease (curie)
);

-- -----------------------------------------------------
-- Drug
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS drug (
    curie VARCHAR(20) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS drug_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_drug FOREIGN KEY (curie)
        REFERENCES drug (curie)
);

-- -----------------------------------------------------
-- Edges
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS edges (
    edge_id INT NOT NULL AUTO_INCREMENT,
    source_id VARCHAR(20) NOT NULL,
    source_entity INT NOT NULL,
    target_id VARCHAR(20) NOT NULL,
    target_entity INT NOT NULL,
    type VARCHAR(50),
    relation VARCHAR(50) NOT NULL,
    defined_datetime DATETIME NOT NULL,
    evidence_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (edge_id)
);

-- -----------------------------------------------------
-- Entity
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS entity (
    entity_id INT NOT NULL AUTO_INCREMENT,
    entity_dsc VARCHAR(20),
    PRIMARY KEY (entity_id)
);

INSERT INTO entity (entity_id, entity_dsc)
    VALUES (1, 'biomarker'), (2, 'disease'), (3, 'drug');

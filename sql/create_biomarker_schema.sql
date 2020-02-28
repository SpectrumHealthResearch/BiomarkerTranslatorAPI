DROP DATABASE IF EXISTS biomarker;
CREATE SCHEMA IF NOT EXISTS biomarker DEFAULT CHARACTER SET utf8;
USE biomarker;

CREATE TABLE IF NOT EXISTS bm_biomarker (
    curie VARCHAR(20) NOT NULL,
    symbol VARCHAR(20),
    type VARCHAR(50),
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS bm_biomarker_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_biomarker FOREIGN KEY (curie)
        REFERENCES bm_biomarker (curie)
);

CREATE TABLE IF NOT EXISTS bm_disease (
    curie VARCHAR(20) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS bm_disease_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_disease FOREIGN KEY (curie)
        REFERENCES bm_disease (curie)
);


CREATE TABLE IF NOT EXISTS bm_drug (
    curie VARCHAR(20) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (curie)
);

CREATE TABLE IF NOT EXISTS bm_drug_alias (
    curie VARCHAR(20) NOT NULL,
    alias VARCHAR(50) NOT NULL,
    PRIMARY KEY (curie , alias),
    CONSTRAINT fk_drug FOREIGN KEY (curie)
        REFERENCES bm_drug (curie)
);

CREATE TABLE IF NOT EXISTS bm_edges (
    edge_id INT NOT NULL AUTO_INCREMENT,
    source_id VARCHAR(20) NOT NULL,
    target_id VARCHAR(20) NOT NULL,
    type VARCHAR(50),
    relation VARCHAR(50) NOT NULL,
    defined_datetime DATETIME NOT NULL,
    evidence_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (edge_id)
);











-- Création de la table utilisateur
CREATE TABLE utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    courriel VARCHAR(255) UNIQUE,
    cle_api VARCHAR(30) UNIQUE,
    password VARCHAR(100)
);

-- Création de la table taches
CREATE TABLE taches (
    id SERIAL PRIMARY KEY,
    utilisateur_id INT,
    titre VARCHAR(100),
    description VARCHAR(500) NULL,
    date_debut DATE,
    date_echeance DATE,
    complete BOOLEAN,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);

-- Création de la table sous_taches
CREATE TABLE sous_taches (
    id SERIAL PRIMARY KEY,
    tache_id INT,
    titre VARCHAR(100),
    complete BOOLEAN,
    FOREIGN KEY (tache_id) REFERENCES taches(id)
);

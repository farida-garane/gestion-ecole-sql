-- CREATION D'UNE BASE DE DONNEE POUR LA GESTION D'UNE ECOLE

-- =============CREATION DES TABLES=============

-- Table de base
CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    niveau VARCHAR(50) NOT NULL
);

CREATE TABLE professeurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES classes(id)
);

-- les relations
CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    coefficient INT,
    id_professeur INT,
    id_classe INT,
    FOREIGN KEY (id_professeur) REFERENCES professeurs(id),
    FOREIGN KEY (id_classe) REFERENCES classes(id)
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note DECIMAL(4,2),
    id_etudiant INT,
    id_cours INT,
    date_examen DATE,
    FOREIGN KEY (id_etudiant) REFERENCES etudiants(id),
    FOREIGN KEY (id_cours) REFERENCES cours(id)
);

-- =============INSERER LES DONNEES=============

-- INSÉRER LES CLASSES
INSERT INTO classes (nom, niveau) VALUES
('CP1', 'Primaire'),
('CP2', 'Primaire'),
('CE1', 'Primaire'),
('CE2', 'Primaire'),
('CM1', 'Primaire'),
('CM2', 'Primaire');

-- INSÉRER LES PROFESSEURS
INSERT INTO professeurs (nom, prenom, email) VALUES
('Kaboré', 'Jean', 'kabore@ecole.com'),
('Sawadogo', 'Marie', 'sawadogo@ecole.com'),
('Ouédraogo', 'Paul', 'ouedraogo@ecole.com');

-- INSÉRER LES ÉTUDIANTS
INSERT INTO etudiants (nom, prenom, date_naissance, id_classe) VALUES
('Ouédraogo', 'Ousseni', '2018-01-01', 1),
('Kaboré', 'Fatima', '2017-05-12', 1),
('Sawadogo', 'Ibrahim', '2018-03-20', 2),
('Traoré', 'Aïcha', '2017-09-08', 2),
('Diallo', 'Moussa', '2016-11-15', 3),
('Zongo', 'Mariam', '2016-07-22', 3);

-- INSÉRER LES COURS
INSERT INTO cours (nom, coefficient, id_professeur, id_classe) VALUES
('Mathématiques', 10, 1, 1),
('Français', 10, 2, 1),
('Sciences', 5, 3, 1),
('Mathématiques', 10, 1, 2),
('Français', 10, 2, 2),
('Mathématiques', 10, 1, 3),
('Histoire-Géographie', 5, 3, 3);

-- INSÉRER LES NOTES
INSERT INTO notes (note, id_etudiant, id_cours, date_examen) VALUES
(15.5, 1, 1, '2024-01-15'),
(12.0, 1, 2, '2024-01-16'),
(14.0, 1, 3, '2024-01-17'),
(18.0, 2, 1, '2024-01-15'),
(16.5, 2, 2, '2024-01-16'),
(13.0, 3, 4, '2024-01-15'),
(11.5, 3, 5, '2024-01-16'),
(17.0, 4, 4, '2024-01-15'),
(15.0, 4, 5, '2024-01-16'),
(14.5, 5, 6, '2024-01-15'),
(12.5, 5, 7, '2024-01-16'),
(19.0, 6, 6, '2024-01-15'),
(16.0, 6, 7, '2024-01-16');

-- ===========MODIFIER==================
-- Modifier le nom d'une classe
UPDATE classes SET nom = 'CM2' WHERE id = 2;

-- Modifier l'email d'un professeur
UPDATE professeurs SET email = 'nouveau@ecole.com' WHERE id = 1;

-- Modifier la classe d'un étudiant
UPDATE etudiants SET id_classe = 2 WHERE id = 1;

-- Modifier le coefficient d'un cours
UPDATE cours SET coefficient = 5 WHERE id = 1;

-- Corriger une note
UPDATE notes SET note = 16.0 WHERE id = 1;

-- =============SUPPRIMER============
-- Supprimer une note
DELETE FROM notes WHERE id = 1;

-- Supprimer un étudiant
DELETE FROM etudiants WHERE id = 2;

-- Supprimer un cours
DELETE FROM cours WHERE id = 3;

-- Supprimer un professeur
DELETE FROM professeurs WHERE id = 2;

-- Supprimer une classe
DELETE FROM classes WHERE id = 3;

-- =========INTERROGER LES DONNEES=======================
-- VOIR TOUS LES ÉTUDIANTS
SELECT * FROM etudiants;

-- VOIR TOUS LES PROFESSEURS
SELECT * FROM professeurs;

-- VOIR TOUS LES COURS
SELECT * FROM cours;

-- VOIR TOUTES LES NOTES
SELECT * FROM notes;

-- VOIR LES ÉTUDIANTS AVEC LE NOM DE LEUR CLASSE
SELECT etudiants.nom, etudiants.prenom, classes.nom AS classe
FROM etudiants
INNER JOIN classes ON etudiants.id_classe = classes.id;

-- VOIR LES COURS AVEC LE NOM DU PROFESSEUR
SELECT cours.nom, professeurs.nom AS professeur
FROM cours
INNER JOIN professeurs ON cours.id_professeur = professeurs.id;

-- VOIR LES NOTES DES ÉTUDIANT AVEC LE NOM DU COURS
SELECT etudiants.nom, etudiants.prenom, cours.nom AS cours, notes.note
FROM notes
INNER JOIN etudiants ON notes.id_etudiant = etudiants.id
INNER JOIN cours ON notes.id_cours = cours.id;

-- VOIR LES ÉTUDIANTS D'UNE CLASSE PRÉCISE
SELECT etudiants.nom, etudiants.prenom, classes.nom AS classe
FROM etudiants
INNER JOIN classes ON etudiants.id_classe = classes.id
WHERE classes.id = 1;

-- ---- Analyser les données
-- VOIR TOUTES LES MOYENNES
SELECT etudiants.nom, etudiants.prenom, AVG(notes.note) AS moyenne
FROM notes
INNER JOIN etudiants ON notes.id_etudiant = etudiants.id
GROUP BY etudiants.id;

-- LA MEILLEURE MOYENNE
SELECT etudiants.nom, etudiants.prenom, AVG(notes.note) AS moyenne
FROM notes
INNER JOIN etudiants ON notes.id_etudiant = etudiants.id
GROUP BY etudiants.id
ORDER BY moyenne DESC
LIMIT 1;

-- LA PLUS FAIBLE MOYENNE
SELECT etudiants.nom, etudiants.prenom, AVG(notes.note) AS moyenne
FROM notes
INNER JOIN etudiants ON notes.id_etudiant = etudiants.id
GROUP BY etudiants.id
ORDER BY moyenne ASC
LIMIT 1;

-- NOMBRE D'ÉTUDIANTS PAR CLASSE
SELECT classes.nom, COUNT(etudiants.id) AS nombre_etudiants
FROM classes
INNER JOIN etudiants ON classes.id = etudiants.id_classe
GROUP BY classes.id;

-- MOYENNE GÉNÉRALE PAR COURS
SELECT cours.nom, AVG(notes.note) AS moyenne
FROM notes
INNER JOIN cours ON notes.id_cours = cours.id
GROUP BY cours.id
ORDER BY moyenne DESC;
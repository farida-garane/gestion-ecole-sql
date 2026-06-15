
# 🏫 Gestion d'une École — SQL

Projet d'apprentissage SQL — Gestion complète d'une école primaire.

## Description

Ce projet est une base de données SQL qui permet de gérer une école. Il couvre les concepts fondamentaux du SQL : création de tables, relations entre tables, insertion de données, modification, suppression, requêtes et analyse.

## Structure de la base de données

La base de données contient 5 tables :

- **classes** — les classes de l'école (CP1, CP2, CE1...)
- **professeurs** — les professeurs (nom, prénom, email)
- **etudiants** — les élèves (nom, prénom, date de naissance)
- **cours** — les matières enseignées (nom, coefficient)
- **notes** — les notes des élèves par cours

## Relations entre les tables

- Un étudiant appartient à **une classe**
- Un cours est enseigné par **un professeur**
- Un cours appartient à **une classe**
- Une note est liée à **un étudiant** et à **un cours**

## Fonctionnalités

### Création
- Créer et structurer une base de données relationnelle
- Définir des clés étrangères entre les tables

### Insertion
- Ajouter des classes, professeurs, étudiants, cours et notes

### Modification
- Modifier les informations d'un étudiant, professeur, cours ou note

### Suppression
- Supprimer des données dans le bon ordre selon les relations

### Interrogation
- Voir les étudiants avec le nom de leur classe
- Voir les cours avec le nom du professeur
- Voir les notes d'un étudiant avec le nom du cours
- Voir les étudiants d'une classe précise

### Analyse
- Calculer la moyenne de chaque étudiant
- Trouver le meilleur et le plus faible étudiant
- Compter le nombre d'étudiants par classe
- Calculer la moyenne générale par cours

## Technologies utilisées

- MySQL
- phpMyAdmin (WAMP)
- VS Code

## Comment utiliser ce projet

1. Ouvre WAMP et lance phpMyAdmin
2. Crée une nouvelle base de données
3. Clique sur l'onglet SQL
4. Colle le contenu du fichier `ecole.sql`
5. Clique sur Exécuter

## Auteur

**GARANE Farida**  

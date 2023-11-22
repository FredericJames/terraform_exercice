# Exercice DnG

## Objectif :
Développer un script Terraform pour déployer une application web ReactJS avec une API backend en FastAPI, en utilisant une base de données Supabase et intégrant un modèle Vertex AI (par exemple, Palm2 ou Llama2).

## Exigences de l'Exercice :
1. Déploiement Frontend ReactJS
   - Déployer un front ReactJs avec des données factice de type Hello World.
   - S'assurer que le bucket est sécurisé mais accessible publiquement pour servir l'application web.

2. API Backend FastAPI
   - Déployer l'API FastAPI avec un exemple factice.
   - Configurer les variables d'environnement nécessaires, y compris les chaînes de connexion pour la base de données.

3. Base de Données Supabase
   - Configurer un service de base de données compatible avec Supabase (par exemple, PostgreSQL)
   - Assurer la sécurité et les performances de la base de données.

4. Intégration Vertex AI
   - Mettre en place une configuration permettant d'utiliser un modèle AI préexistant sur Vertex AI.
   - Assurer une intégration fluide avec l'API FastAPI.

5. Sécurité et Networking
   - Configurer les VPC, les règles de firewall, et les politiques IAM pour sécuriser l'ensemble de l'infrastructure.
   - Documenter toute règle de sécurité ou configuration réseau spéciale mise en place.

6. Documentation
   - Inclure des commentaires dans le code Terraform pour expliquer les choix d'architecture.

## Livraison :
- Un repository Git avec le code Terraform.
- Documentation détaillée dans un fichier README.md.

## Critères d'Évaluation :


- Fonctionnalité : L'infrastructure déployée fonctionne comme prévu.
- Sécurité : Les meilleures pratiques de sécurité sont appliquées.
- Qualité du code : Le code est propre, bien organisé, et bien commenté.
- Documentation : Clarté et exhaustivité de la documentation.

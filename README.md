# MigrationTools v1.1

## Description

MigrationTools est un script PowerShell conçu pour faciliter la sauvegarde et la restauration de plusieurs éléments importants d'un utilisateur Windows. Il inclut des fonctionnalités pour copier et restaurer les favoris des navigateurs, sauvegarder les informations des imprimantes et des partages réseau, et vérifier les archives Outlook (.pst).

## Fonctionnalités

- **Sauvegarde des favoris des navigateurs** :
  - Google Chrome
  - Mozilla Firefox
  - Microsoft Edge
- **Sauvegarde des informations des imprimantes et des partages réseau**
- **Sauvegarde du fond d'écran**
- **Vérification et affichage des fichiers d'archive Outlook (.pst)**
- **Sauvegarde et restauration complètes**

## Instructions

### Prérequis

- PowerShell (version 5.1 ou ultérieure)

### Installation

1. Clonez le dépôt GitHub :
    ```sh
    git clone https://github.com/votre-utilisateur/MigrationTools.git
    ```
2. Accédez au répertoire du script :
    ```sh
    cd MigrationTools
    ```

### Utilisation

1. Ouvrez une session PowerShell en tant qu'administrateur.
2. Exécutez le script :
    ```sh
    .\MigrationTools.ps1
    ```
3. Suivez les instructions à l'écran pour choisir les options de sauvegarde ou de restauration.

### Sauvegarde

Le menu de sauvegarde vous permet de :

1. Copier les favoris Google Chrome.
2. Copier les favoris Mozilla Firefox.
3. Copier les favoris Microsoft Edge.
4. Copier tous les favoris.
5. Sauvegarder les imprimantes et les partages réseau.
6. Sauvegarder le fond d'écran.
7. Vérifier et afficher les archives Outlook (.pst).
8. Effectuer une sauvegarde complète.

### Restauration

Le menu de restauration vous permet de :

1. Restaurer les favoris Google Chrome.
2. Restaurer les favoris Mozilla Firefox.
3. Restaurer les favoris Microsoft Edge.
4. Restaurer tous les favoris.

# PARADOX-EG
Site web pour PARADOX ESCAPE GAME

Les repositories pour les applis desktop et mobile se trouvent respectivement aux adresses suivantes :
- https://github.com/18020777/PEG_DESKTOP
- https://github.com/18020777/PEG_MOBILE.git

Les instructions d'exécution en local se trouvent dans leur propre fichier README.md.

Le site web est accessible en ligne à l'adresse suivante :
https://sheltered-oasis-16253-bb111470476b.herokuapp.com/

### A. Exécuter le site en local :

1. Cloner le repo
2. Créez un environnement virtuel dans le dossier racine et activez le
3. Téléchargez les requirements (`pip install -r requirements.txt`)
4. Créez une base de données mysql ou mariadb
5. Importez le backup disponible : `mysql -u username -p database-name < backup_paradox_db.sql`
6. Créez un fichier local_settings dans le dossier paradox et insérez-y vos paramètres de connexion à votre BDD :
    ```
   DATABASES = {
   'default': {
             'ENGINE': 'django.db.backends.mysql',
             'NAME': 'paradox_db',

            # Following information must be specified in local_settings.py:
            'USER': 'user',
            'PASSWORD': 'password',
            'HOST': 'localhost',
            'PORT': '3306',
        }
   }
    ```
7. `python manage.py migrate`
8. `python manage.py runserver`


### B. Création d'un administrateur local

1. Ouvrez le shell Django : `python manage.py shell`
2. Importez le modèle *User* : `from pegapp.models import User`
3. Créez un nouveau super-utilisateur : `User.objects.create_superuser(username='local_admin', password='admin_password')`
4. Lancez le serveur avec `python manage.py runserver`, rendez vous sur l'[administration Django du site local](http://127.0.0.1:8000/admin) et connectez-vous avec votre identifiant et mot de passe (respectivement `local_admin` et `admin_password` par défaut)
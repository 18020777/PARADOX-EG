# Notice d'utilisation de PARADOX-EG API REST

L'API REST a été développée à l'aide de Django REST Framework pour faciliter l'accès et la manipulation des données de votre application. Voici comment utiliser les différentes fonctionnalités de l'API :

## Vue d'ensemble des endpoints

L'API fournit les endpoints suivants :

- `/api/scenario/` : Endpoint pour récupérer la liste des scénarios disponibles.
- `/api/user/` : Endpoint pour récupérer la liste des utilisateurs.
- `/api/booking/` : Endpoint pour gérer les réservations.
- `/api/room/` : Endpoint pour récupérer la liste des salles.
- `/api/prices/` : Endpoint pour récupérer la liste des prix.
- `/api/availability/` : Endpoint pour vérifier la disponibilité des salles pour un scénario et une date donnés.
- `/api/is_staff/` : Endpoint pour vérifier si l'utilisateur est membre du personnel.
- `/api/is_admin/` : Endpoint pour vérifier si l'utilisateur est administrateur.
- `/api/booking_action/` : Endpoint pour effectuer des actions sur une réservation.
- `/api/token/` : Endpoint pour obtenir un jeton d'authentification.

## Authentification

Certains endpoints de l'API nécessitent une authentification. Pour obtenir un jeton d'authentification, vous devez envoyer une requête POST à l'endpoint `/api/token/` avec les informations d'identification de l'utilisateur (nom d'utilisateur et mot de passe) dans le corps de la requête. Vous recevrez en réponse un jeton d'authentification que vous devrez inclure dans les en-têtes de toutes les requêtes ultérieures nécessitant une authentification.

Exemple de requête pour obtenir un jeton d'authentification :

```http
POST /api/token/

{
"username": "votre_nom_d_utilisateur",
"password": "votre_mot_de_passe"
}
```

## Endpoints

Voici comment utiliser les différents endpoints de l'API :

### Récupérer la liste des scénarios

Endpoint : `/api/scenario/`

Méthode HTTP : GET

Exemple de requête pour récupérer la liste des scénarios :

```http
GET /api/scenario/
```

### Récupérer la liste des utilisateurs

Endpoint : `/api/user/`

Méthode HTTP : GET

Exemple de requête pour récupérer la liste des utilisateurs :

```http
GET /api/user/
```

### Gérer les réservations

Endpoint : `/api/booking/`

Méthodes HTTP : GET, POST, PUT, DELETE

Exemple de requête pour récupérer la liste des réservations :

```http
GET /api/booking/
```

Exemple de requête pour créer une réservation :

```http
POST /api/booking/

{
"user": "ID_utilisateur",
"scenario": "ID_scenario",
"date": "date",
"time": "heure",
"num_players": "nombre_joueurs"
}
```

Exemple de requête pour mettre à jour une réservation :

```http
PUT /api/booking/ID_reservation/

{
"user": "ID_utilisateur",
"scenario": "ID_scenario",
"date": "nouvelle_date",
"time": "nouvelle_heure",
"num_players": "nouveau_nombre_joueurs"
}
```

Exemple de requête pour supprimer une réservation :

```http
DELETE /api/booking/ID_reservation/
```

### Récupérer la liste des salles

Endpoint : `/api/room/`

Méthode HTTP : GET

Exemple de requête pour récupérer la liste des salles :

```http
GET /api/room/
```

### Récupérer la liste des prix

Endpoint : `/api/prices/`

Méthode HTTP : GET

Exemple de requête pour récupérer la liste des prix :

```http
GET /api/prices/
```

### Vérifier la disponibilité des salles

Endpoint : `/api/availability/`

Méthode HTTP : GET

Exemple de requête pour vérifier la disponibilité des salles :

```http
GET /api/availability/?scenario=ID_scenario&date=date
```

### Vérifier si l'utilisateur est membre du personnel

Endpoint : `/api/is_staff/`

Méthode HTTP : GET

Exemple de requête pour vérifier si l'utilisateur est membre du personnel :

```http
GET /api/is_staff/
```

### Vérifier si l'utilisateur est administrateur

Endpoint : `/api/is_admin/`

Méthode HTTP : GET

Exemple de requête pour vérifier si l'utilisateur est administrateur :

```http
GET /api/is_admin/
```

### Effectuer une action sur une réservation

Endpoint : `/api/booking_action/`

Méthode HTTP : POST

Exemple de requête pour effectuer une action sur une réservation :

```http
POST /api/booking_action/

{
"booking_id": "ID_reservation",
"action": "action"
}
```

Les actions possibles sont : "start_game" et "end_game".

Ceci conclut la notice d'utilisation de votre API REST réalisée avec Django REST Framework. Utilisez ces informations pour interagir avec votre API et effectuer les opérations nécessaires.

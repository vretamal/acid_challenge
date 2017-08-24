# Acid Challenge

Challenge to apply for Acid Labs

## Getting Started

To run this project localy, you must excecute `rails s`.

Demo on [Heroku](https://acid-challenge.herokuapp.com/)

### Prerequisites

Do you need install:
- Ruby on Rails 5.1
- Postgresql

### Installing

Install the gems, create de database and migrate the database.

```
bundle install
rake db:create
rake db:migrate
```

## Routes
```
Verb   URI Pattern
GET    /
POST   /login_form_post(.:format)
GET    /users(.:format)
POST   /users(.:format)
GET    /users/new(.:format)
GET    /users/:id/edit(.:format)
GET    /users/:id(.:format)
PATCH  /users/:id(.:format)
PUT    /users/:id(.:format)
DELETE /users/:id(.:format)
POST   /rest/login(.:format)
POST   /rest/verify_user/:email(.:format)
```
## Authors

* **Vicente Retamal** - *Initial work* - [Personal GitHub](https://github.com/vretamal)
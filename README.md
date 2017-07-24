## Bloccit 
### SUMMARY

Bloccit is a Reddit-like application designed to let users share and explore posts and links from across the internet. Users can comment on public posts, use Markdown to style their own posts and up-vote or down-vote any posts they come across. Bloccit was built with Ruby on Rails.

### TECHNOLOGIES USED

**Ruby, Ruby on Rails, HTML5, CSS3, JavaScript, Git**

View the app: https://cookit-grandmasrecipes.herokuapp.com/

View the project http://github.com/dmhuebner/bloccit

-----------------------------------------------------------------

### EXPLANATION

The goal of this project was to build an application modeled after Reddit to practice building CRUD applications with Ruby on Rails. It was created according to user stories provided in the Bloc Full Stack Developer curriculum.

Bloccit features custom user authentication and authorization using the bcrypt gem and uses Rails’ ActiveRecord::Enum class for different user types (admin, moderator, standard, etc.) Guest users can read through posts in public topics and view user comments. Users can create a free account to create their own posts, comment on other users’ posts and up or down vote posts they find interesting.

Bloccit has a simple, modern, mobile responsive design optimized for users on any size devise.

-----------------------------------------------------------------

## Setup and Configuration
**Ruby v. 2.2.4**
**Rails v. 4.2.5**
**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Gems Used:** 
- Bcrypt, User data encryption
- Bootstrap, Styling
- Factory Girl, Testing/development
- Figaro, Environment variables
- jQuery, JavaScript library
- RedCarpet, Markdown syntax
- Rspec, Testing
- Shoulda, Relational/validation testing

**Set-up:**
- Environmental variables are secured with the Figaro gem and must be set up in config/application.yml (ignored by github)
- The config/application.example.yml demonstrates the necessary environment variables setup.

**To run locally:**
- Clone repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the Rails server

# URL Shortener API

A simple URL shortening service built using Ruby on Rails. The service allows users to shorten long URLs and access the original URLs via the shortened links. It also exposes an API for external web clients to create short URLs.

Things you may want to cover:

* Features
  - Create a shortened URL: Shortens a given long URL and provides a shortened URL.
  - Swagger UI: Interactive API documentation for testing endpoints.
  - JWT Authentication: Protects the API with JWT-based authentication.   

* Ruby version
  - Ruby 3.2.2

* System dependencies
  - Ruby 3.2.2
  - Rails 7.1.5
  - SQLite (or other database of choice)
  - JWT gem for token-based authentication
  - rswag for Swagger API documentation

* Configuration
  1. Clone the repository:
    - `git clone https://github.com/Milan0799/url_shortener.git`
    - `cd url_shortener`
  2. Install dependencies:
     Ensure you have Ruby installed and then run: `bundle install`
  3. Set up the database:
     Run the following command to set up the database: 
       - `bin/rails db:create`
       - `bin/rails db:migrate`

* How to run the test suite:
  To run the tests for the URL shortening API, use the following command: `bundle exec rspec`.
  This will run the RSpec tests for the API endpoints, including URL shortening functionality, validation, and error handling.

* Swagger UI:
  The API is documented using Swagger. You can interact with the API through the Swagger UI by visiting: `http://localhost:3000/api-docs`
  The documentation includes the endpoint for creating shortened URL.

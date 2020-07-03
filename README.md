# Ejercicio Práctico Kinedu

- Ruby version
  > ruby 2.7.0p0
- System dependencies
  > Rspec
  > Factory Bot
  > Shoulda Matchers
  > Faker
  > Database Cleaner
  > Mysql2
  > Active Model Serializers
- Configuration
  - 1.- Create a file .env in the project path with the next structure
    ```v
      export KINEDU_DATABASE_USERNAME="root"
      export KINEDU_DATABASE_PASSWORD="yourdatabasepassword"
      export KINEDU_SOCKET="/tmp/mysql.sock"
      export KINEDU_DEVELOPMENT_DATABASE="kinedu_development"
      export KINEDU_TEST_DATABASE="kinedu_test"
      export KINEDU_PRODUCTION_DATABASE="kinedu"
    ```
  - 2.- Create enviroment variables:
    > source .env
- Database creation
  > rake db:setup
- Database initialization
  > rake db:structure:load
- How to run the test suite
  > bundle exe rspec
- Deployment instructions

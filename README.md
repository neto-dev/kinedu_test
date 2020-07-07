# Ejercicio Práctico Kinedu

- Ruby version
  > ruby 2.7.0p0
- System dependencies
  > - Rspec
  > - Factory Bot
  > - Shoulda Matchers
  > - Faker
  > - Database Cleaner
  > - Mysql2
  > - Active Model Serializers
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
- Run Project
  > rails s
- Extra instructions
  > In the project path I'm including an insomnia configuration file, in this file are found all routes from the API, they just need to import the file in the insomnia software. File name: insomnia_request_configuration.json

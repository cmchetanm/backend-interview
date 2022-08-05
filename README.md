# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* **Ruby version 3.1.2 and Rails 7.0.3.1**

* Configuration
 **First take clone of the project and then install the rvm 3.1.2**
    then go to project directly and run the command 
  **bundle install**

* Database creation
  Create database by command
      **bundle exec rails db:create**
  and then migrate the database by commands
      **bundle exec rails db:migrate**
   then run the seed file which will create client, and rewards
      **bundle exec rails db:seed**
   
  
* How to run the test suite
* 
  This is postman collection
  **https://www.getpostman.com/collections/b0bd8beb436b908f074b**
  
  Then need to run sidekiq by commands
      **bundle exec ./sidekiq**
  It will run the background jobs 
  and you can check the details by the help of the collections
  
* ...

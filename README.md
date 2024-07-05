# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.0
* Rails version 6.1.4

* Database creation
* Postgresql
* rails db:create
* rails db:migrate
* rails db:seed

* How to run the test suite
* rails db:create RAILS_ENV=test
* rails db:migrate RAILS_ENV=test
* bundle exec rspec

  
* brief code description
* Create user with proper details (unique email, password with length min. 6 character)
* Create task for user created with title, description and deadline.
* initially task will be created with status 'Backlog'
* We have scheduler.rb which will be use for send mail to the owner of task before one day or 1 hour of deadline if status of task is not done.


# task-management-app

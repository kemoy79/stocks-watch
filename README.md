# README

# README

This application is used to track stocks.


This app was developed using the following:

* Ruby 2.6.6

* Rails 6.0.3

* PostgreSQL 10.9

Ensure the above or compatible versions are installed on your system prior to running this application.


                          STEPS TO RUN APPLICATION

1.) Clone/download the project to your desired location

2.) `cd` into the project and run `bundle install`

    -- this will install ruby gems/dependencies

3.) Set up database credentials to match that of your postgres installation

    -- settings are found in config/database.yml
    -- configure details for development and test environment
    -- run rake db:setup after entering credentials

4.) Next run `rails db:migrate` to run migrations

5.) After that, run `rails server` and navigate to localhost:3000

6.) Enjoy the application !!

* 


* ...

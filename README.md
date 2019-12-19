# CS370 
[![Build Status](https://travis-ci.com/clarkpalmer/cs370.svg?branch=master)](https://travis-ci.com/clarkpalmer/cs370)
[![Maintainability](https://api.codeclimate.com/v1/badges/bd2a81f1be2a0765cdb6/maintainability)](https://codeclimate.com/github/clarkpalmer/cs370/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/bd2a81f1be2a0765cdb6/test_coverage)](https://codeclimate.com/github/clarkpalmer/cs370/test_coverage)

## Requirements
* Rails 5.2.3
* PostgresSQL

If you need help setting up a Ruby development environment, check out this [guide](https://mattbrictson.com/rails-osx-setup-guide)

## Description:
The application is meant to facilitate tutoring session for cs370.

If you are a student, with the web application you will be able to do the following:
* Feature 1: Create and edit user profile
* Feature 2: Monitor tutoring session history
* Feature 3: Evaluate your tutor and give constructive feedback.
* Feature 4: Request for a tutor and monitor weekly requests.
* Feature 5: Log in via password and email
* Feature 6: Request to be tutored for a specific topic on the student dashboard and edit if needed
* Feature 7: After the tutor has approved your request, on the new meeting tab, you can choose between a set of available times set up by the tutor

If you are a tutor, you will be able to do the following:
* Feature 1: Create and edit user profile
* Feature 2: Select a preferred student you would like to tutor.
* Feature 3: Email the student to set up a meeting.
* Feature 4: Monitor hours worked and view ratings generated by students.
* Feature 5: Log in via email
* Feature 6: Keep track of scheduled tutoring sessions by logging them
* Feature 7: Can set up your best times and locations of availability so that you can coordinate with the tutee.
* Feature 8: On the student selection page, you can see a list of unmatched students and can select them for tutoring
* Feature 9: Can see the rate (amount of hours per week) that you need to complete your goal

If you are an admin, you will be able to do the following:
* Feature 1: Set semester and list of courses you are offering for tutoring
* Feature 2: Generate a table with list of tutors and hours worked
* Feature 3: Generate composite score for tutors
* Feature 4: Set privilege for students by simply entering their student sid
* Feature 5: Change admin password
* Feature 6: Login with the admin account to view admin-privileged information.

## Requirements
* Rails 5.2.3
* PostgresSQL
* Mailcatcher - Dev Only

If you need help setting up a Ruby development environment, check out this [guide](https://mattbrictson.com/rails-osx-setup-guide)

## Setting Up and Testing
Run the following command in CS370 directory:
```
$ bundle install --without production
```
This will download any files along with gems in order to make the app run properly.

```
$ rails db:reset
$ rails db:migrate
$ rails server
```
This will launch the server.
* You may need to set up admin credential locally first in order to access admin page.
Do the following:
```
$ rails c
````
This opens the Rails development enviroment. For example:
```
Running via Spring preloader in process 89006
Loading development environment (Rails 5.2.3)
2.5.3 :001 > 
```
Now, you will have to initialize an Admin object by the following line:
```
> Admin.create(:password => "1234", :current_semester => "Spring 2019", :statistics_semester => "Spring 2019")
```
Lastly, in order to view coverage and run tests. Do:
```
$ cucumber
```
and/or
```
$ rspec
```

In development email are caught by local smtp server, mailcatcher. If you want to view email please do the following OUTSIDE of the project. There will be dependicy issues if you try to include mailcatcher in gem file

```
$ gem install mailcatcher
$ mailcatcher
```
## What's included?
**These gems are added to the standard Rails stack**
* Core
* Configuration
* Utilities
* Security
    * [friendly_id](https://github.com/norman/friendly_id) - Allows evaluations to be edited publicly
    * [devise](https://github.com/plataformatec/devise) - Log int authentication system in place
* Testing
    * [simplecov](https://github.com/colszowka/simplecov) - Code coverage reports
    * [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Use case was to ensure a clean state during tests.
    * [rails_12factor](https://github.com/heroku/rails_12factor) - Writes better error logs
    * [cucumber-rails](https://github.com/cucumber/cucumber-rails) - Used for writing tests with stories and integration tests
    * [rspec](https://rspec.info) - Allows to write unit and function tests
* Beautifying
    * (optional) [bootstrap](https://getbootstrap.com) - Used for designing layout of application
    * (optional) [bootstrap-datepicker-rails](https://github.com/Nerian/bootstrap-datepicker-rails) - Used to format date when creating/editing birthday
    * (optional) [bootstrap-glyphicons](https://github.com/anjlab/bootstrap-glyphicons) - Used for design of tutee page
    * (optional) [autoprefixer-rails](https://github.com/ai/autoprefixer-rails) - Tool to parse CSS and add vendor prefixes to CSS rules using values from the Can I Use database
    * (optional) [jquery-rails](https://github.com/rails/jquery-rails) - This gem provides jQuery 1, 2 and 3, the jQuery UJS adapter, assert_select_jquery to test jQuery responses in Ruby tests
    
## Deployment
The first thing you want to do is check if you have git.
```
$ git --version
```
If you do not have git, install it following this [guide](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/).

The next step you want to take is create a heroku account if you dont already have it.
To deploy the application to heroku start first by creating a [Heroku](https://signup.heroku.com/) account.
When you have an account follow this [heroku guide deployment guide](https://devcenter.heroku.com/articles/git).
And thats how you deploy to heroku using git.

After the application is up and running in heroku, reset and seed the database. You should only do this once.
```
$ heroku restart
$ heroku pg:reset DATABASE` (no need to change the `DATABASE`)
$ heroku run rake db:migrate
$ heroku run rake db:seed
```
Then, create an admin to set the semester and begin using the application.
To create an admin, run the following in the git repository linked to heroku.
```
$ heroku run rails c
```
This will create a ruby console for the heroku app. Then, simply copy and paste the following code to create an admin.
```
> Admin.create(:password => "1234", :current_semester => "Spring 2019", :statistics_semester => "Spring 2019")
```
This will create an admin for the deployed application. Now type exit to get out of the rails console.
```
> exit
```
There you have it, you can now log in as admin and set the semester, and courses. and the app is ready for use.

## Future Possible Features

* Student Selection Priority and Filtering: As a tutor, so that you can match with students in need of help, you should see a list of students ranked by priority. For instance, those CS scholar and students who have not been selected for a while.

* Manual Filtering: As a tutor, when you are browsing between students, you can manually filter students based on their courses or topics of interest.

* Live OCF Link: After the admin successfully registers with the OCF center with a username and password of his choice, he may have a live working link (website_name.berkeley.edu) after transferring the application files through SSH. 

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


For Registration

  URL For Registration : http://localhost:3000/api/v1/registrations/create_user

  Required Params : email, password and confirm_password

  http://localhost:3000/api/v1/registrations/create_user?email=arslan@gmail.com&password=123456&confirm_password=123456

  Method: POST


For Login

  URL For Login : http://localhost:3000/api/v1/logins/login_user

  Require Params : email and password

  http://localhost:3000/api/v1/logins/login_user?email=test@gmail.com&password=123456&confirm_password=123456

  Method: POST

For Logout

  URL For Logout : http://localhost:3000/api/v1/logins/logout_user

  Require Params : email

  http://localhost:3000/api/v1/logins/logout_user?email=test@gmail.com

  Method: POST

For Jobs
  URL for Jobs Queue: http://localhost:3000/api/v1/jobs/jobs_queue

  Method: GET

  No Params Required

  URL for Create Jobs:  http://localhost:3000/api/v1/jobs/create_jobs

  http://localhost:3000/api/v1/jobs/create_jobs?job_title=dev&job_description=dekai&no_of_posts=3&status=done&priority=high&queue_time=10:41

  Method: POST

For Sidekiq Jobs
  Run local server and Sidekiq Server for worker jobs

For manual Jobs
  Run this commad rake job_task:job_task

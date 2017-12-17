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

## Application information

I've hosted this app on Heroku for easy access and, you can visit it here:
In order to avoid the registration process and skip to the login, you can login as a provider with the credentials:
In order to login as a patient you can use the credentials:
_______________ fill in info__________


## Design decisions

I chose to use Rails over a Ruby framework more suited to APIs, like Sinatra, purely because I thought it would be a good idea to show familiarity with Rails. Based on the specifications, I would think that something like Sinatra would be better suited to exclusively create these API endpoints.

### Model decisions

A picture of the database schema can be found in db/schema.png.

I considered implementing the user model of care_managers and patients in two different ways.

The way I ended up implementing was a single model for User which contains a field for their role (either care_manager or patient). You could also separate the role field into it's own table (which people oftentimes do in rails), however, many times we need to know user information we also will want to know their role, so in this case it makes sense to keep the role field as part of the User model. Here is a picture of that final schema:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_final.png "Users care managers")


I was confused a bit by this specification in the challenge: "Each patient is part of exactly one message thread in which many care managers can participate in". I was not sure if care_managers should be assigned to patients, and only care_managers that are assigned to patients through a join table patient_care_managers should be allowed to participate in message_threads with those patients. Then in order to get message_threads that a care_manager is a part of, we can join message_threads and users_care_managers on patient_id. Due to doctor patient confidentiality rules, I figured this should be implemented.

One decision that was made was to add the field role to the user model rather than separate it off into a separate table. Many times that we will be accessing user information in this application, we will also want to know about the role, so it will provide the fastest read access. Also, role information will be centrally managed, and having it as part of the user model makes it easiest.

Instead of enforcing uniqueness of a patient only having a single message thread at the database level, I enforced it at the model level. This way, if later a design change is made where patients can have more than one thread (say for different surgeries), it will be easier to enforce that design change. 


### Front-end decisions

### Routing decisions

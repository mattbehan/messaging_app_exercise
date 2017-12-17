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

One decision that was made was to add the field role to the user model rather than separate it off into a separate table. Many times that we will be accessing user information in this application, we will also want to know about the role, so it will provide the fastest read access. Also, role information will be centrally managed, and having it as part of the user model makes it easiest.

Since there should be never be more than one message_thread between a patient and a doctor, I enforced uniqueness at both the database and model level. 

The table message_threads is used to identify 

Should I create two separate models for doctors and patients?
Advantage would be that this clearly dictates the two different roles here, and as the app evolves it could be easier to implement different dashboards and functionality for Doctors and Patients.
Disadvantages are that it's more difficult to do with devise, I'm not sure if it's what they're looking for (or best practice), and 

Should I add message_thread_id to the messages table? Advantage would be that it allows faster retrieval when searching through messages for messages from a specific thread, as opposed to having to search for through messages where both sender_id and recipient_id are equal to the two things you're looking for. I think I should add message_thread_id, because according to their specs, it's a nested resource

### Front-end decisions

### Routing decisions

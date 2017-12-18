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

#### User Model

I considered implementing the user model of care_managers and patients in two different ways.

##### Single user model or multiple user models?
The first way I thought of implementing users was a single model for User which contains a field for their role (either care_manager or patient). You could also separate the role field into it's own table (which people oftentimes do in rails), however, many times we need to know user information we also will want to know their role, so in this case it makes sense to keep the role field as part of the User model. Here is a picture of that schema:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_final.png "Final schema")

The other option for implementing users that I considered was separating the user model into two different models (one for Patient, and one for CareManager) that would both inherit from a parent class of User. This would offer a little more flexibility in terms of clearly dilineating the actions available to patients and care_managers by giving them their own controllers and associations, and allow for clearer assocations (for example, patients shouldn't have an association with thread_subscriptions, but care managers could, I'll be discussing thread_subscriptions next). Separating the user models this way also allows you to clearly and easily display different registration and authentication options (different portals). I think that this a more complete solution and this is what I ended up implementing. Here is that schema:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_with_multiple_user_models.png "Multiple user models schema")

In order to make sure there was no care_manager.id = patient.id, I tied both models to the user model, added an after_create method in both the CareManager model and the Patient model that creates a new user and calls update_column(:id, @user.id) on that CareManager or Patient.


##### The index of 'get /message_threads' for care_managers

I was confused a bit by this specification in the challenge: "Each patient is part of exactly one message thread in which many care managers can participate in". I was not sure if care_managers should be assigned to patients, and only care_managers that are assigned to patients through a join table patient_care_managers should be allowed to participate in message_threads with those patients, or if any care_manager should be able to view and post in any message_thread. 

If care_managers were allowed to post in any message_thread, then we could determine the threads that should be shown in their message_threads index by looking through the messages of that thread to see if they authored any messages. A better way to implement the message_threads index would be to create a join table between care_managers and a message_threads, called thread_subscriptions. That way, care_managers would be able to "unsubscribe" from that message thread if they were no longer giving care to that patient. Here is what a schema that implements thread_subscriptions would look like:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_with_thread_subscriptions_instead_of_patients_care_managers_table.png "Schema with thread subscriptions")


However, since there should be doctor patient confidentiality, I assumed that care_managers should have to be assigned to a patient before viewing and participating in that patient's message_threads, and therefore I did not implement thread_subscriptions. 



One decision that was made was to add the field role to the user model rather than separate it off into a separate table. Many times that we will be accessing user information in this application, we will also want to know about the role, so it will provide the fastest read access. Also, role information will be centrally managed, and having it as part of the user model makes it easiest.

Instead of enforcing uniqueness of a patient only having a single message thread at the database level, I enforced it at the model level. This way, if later a design change is made where patients can have more than one thread (say for different surgeries), it will be easier to enforce that design change. 


### Front-end decisions

### Routing decisions

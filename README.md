# README

## Application information

I've hosted this app on Heroku for easy access and, you can visit it here: https://stark-garden-40380.herokuapp.com/. The source code is hosted on a private github repo at: https://github.com/mattbehan/wellframe_messaging_app
In order to avoid the registration process and skip to the login, you can login as a provider with any of these credentials:
email: doc1@gmail.com
password: password
email: doc2@gmail.com
password: password
email: doc3@gmail.com
password: password
email: doc4@gmail.com
password: password
In order to login as a patient you can use any of these credentials:
email: patient1@gmail.com
password: password
email: patient2@gmail.com
password: password
email: patient3@gmail.com
password: password
email: patient4@gmail.com

You will have to login in order to access the API endpoints from the specifications, and will only be able to access the resources that pertain to that user.


## Design decisions

I chose to use Rails over a Ruby framework more suited to APIs, like Sinatra, purely because I thought it would be a good idea to show familiarity with Rails, and because I thought it'd be fun to create a web app. Based on the specifications, I would think that something like Sinatra would be better suited to exclusively create these API endpoints, or at least Rails in api mode.

### Model decisions

Based on the specifications, it seems that every time a new Patient is created, a new message_thread should be automatically created, so I added an after_create function to the Patient model to take care of that. Additionally, every time a new message is posted, it should automatically show up as read by whomever posted it, but unread to others, so I took care of that in an after_create function in the Message model.

Instead of enforcing uniqueness of a patient only having a single message thread at the database level, I enforced it at the model level. This way, if later a design change is made where patients can have more than one thread (say for different surgeries), it will be easier to enforce that design change. 

#### User Model

I considered implementing the user model of care_managers and patients in two different ways.

##### Single user model or multiple user models?

The first way I thought of implementing users was a single model for User which contains a field for their role (either care_manager or patient). You could also separate the role field into it's own table (which people oftentimes do in rails), however, many times we need to know user information we also will want to know their role, so in this case it would make sense to keep the role field as part of the User model. Here is a picture of that schema:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_final.png "Final schema")

The other option for implementing users that I considered was separating the user model into two different models (one for Patient, and one for CareManager) that would both inherit from a parent class of User. This would offer a little more flexibility in terms of clearly dilineating the actions available to patients and care_managers by giving them their own controllers and associations, and allow for clearer assocations (for example, patients shouldn't have an association with thread_subscriptions, but care managers could, I'll be discussing thread_subscriptions next). Separating the user models this way also allows you to clearly and easily display different registration and authentication options (different portals). By separating Patient and CareManager into their own models, we do sacrifice quick read access, which is pretty important in this application, since a lot of the time we want user information, we also need to know what role they are, and we end up having to go through another table to get that information.

I think that this a more complete solution and this is what I ended up implementing. Here is that schema:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_with_multiple_user_models.png "Multiple user models schema")

In order to make sure we could uniquely identify both care_managers and patients, I tied both models to the user model using a polymorphic association (identifiable) between the devise models (CareManager and Patient) and the user model. Whenever a new CareManager or Patient is created, a new corresponding User is also created in an after_create function.

I used Devise for quick and easy authentication, and in order to make sure that users who are logged in as a CareManager cannot access the resources of a Patient with the same patient.id = care_manager.id, and vice versa, I added an "accessible" module to the sessions controller which checks the users type, and also added a check in patients and care_mangers registrations controller.

##### The index of 'get /message_threads' for care_managers

I was confused a bit by this specification in the challenge: "Each patient is part of exactly one message thread in which many care managers can participate in". I was not sure if care_managers should be assigned to patients, and only care_managers that are assigned to patients through a join table patient_care_managers should be allowed to participate in message_threads with those patients, or if any care_manager should be able to view and post in any message_thread. 

If care_managers were allowed to post in any message_thread, then we could determine the threads that should be shown in their message_threads index by looking through the messages of that thread to see if they authored any messages. A better way to implement the message_threads index would be to create a join table between care_managers and a message_threads, called thread_subscriptions. That way, care_managers would be able to "unsubscribe" from that message thread if they were no longer giving care to that patient. Here is what a schema that implements thread_subscriptions would look like:
![alt text](https://github.com/mattbehan/wellframe_messaging_app/blob/master/db/schema_with_thread_subscriptions_instead_of_patients_care_managers_table.png "Schema with thread subscriptions")


However, since there should be doctor patient confidentiality, I assumed that care_managers should have to be assigned to a patient before viewing and participating in that patient's message_threads, and therefore I did not implement thread_subscriptions. 

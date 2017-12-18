@doctor1 = CareManager.create(email: "doc1@gmail.com", password: "password")
@doctor2 = CareManager.create(email: "doc2@gmail.com", password: "password")
@doctor3 = CareManager.create(email: "doc3@gmail.com", password: "password")
@doctor4 = CareManager.create(email: "doc4@gmail.com", password: "password")

@patient1 = Patient.create(email: "patient1@gmail.com", password: "password")
@patient2 = Patient.create(email: "patient2@gmail.com", password: "password")
@patient3 = Patient.create(email: "patient3@gmail.com", password: "password")
@patient4 = Patient.create(email: "patient4@gmail.com", password: "password")

PatientsCareManager.create(patient_id: 1, care_manager_id: 1)
PatientsCareManager.create(patient_id: 1, care_manager_id: 2)
PatientsCareManager.create(patient_id: 1, care_manager_id: 3)

PatientsCareManager.create(patient_id: 2, care_manager_id: 2)
PatientsCareManager.create(patient_id: 2, care_manager_id: 3)
PatientsCareManager.create(patient_id: 2, care_manager_id: 4)

PatientsCareManager.create(patient_id: 3, care_manager_id: 1)
PatientsCareManager.create(patient_id: 3, care_manager_id: 2)
PatientsCareManager.create(patient_id: 3, care_manager_id: 3)
PatientsCareManager.create(patient_id: 3, care_manager_id: 4)

PatientsCareManager.create(patient_id: 4, care_manager_id: 1)
PatientsCareManager.create(patient_id: 4, care_manager_id: 4)


@doctor1 = CareManager.first.user
@doctor2 = CareManager.second.user
@doctor3 = CareManager.third.user
@doctor4 = CareManager.fourth.user

@patient1 = Patient.first.user
@patient2 = Patient.second.user
@patient3 = Patient.third.user
@patient4 = Patient.fourth.user

@message_thread_1 = MessageThread.first
@message_thread_2 = MessageThread.second
@message_thread_3 = MessageThread.third
@message_thread_4 = MessageThread.fourth

@message1 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor2.id, message_text: "first message in thread -- from doctor2")
@message2 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor3.id, message_text: "second message in thread -- from doctor3")
@message3 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor1.id, message_text: "third message in thread -- from doctor1")
@message4 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor2.id, message_text: "second message in thread -- from doctor2")
@message5 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor3.id, message_text: "second message in thread -- from doctor3")
@message6 = Message.create(message_thread_id: @message_thread_1.id, creator_id: @doctor2.id, message_text: "second message in thread -- from doctor2")

@message7 = Message.create(message_thread_id: @message_thread_2.id, creator_id: @doctor3.id, message_text: "second message in thread -- from doctor3")
@message8 = Message.create(message_thread_id: @message_thread_2.id, creator_id: @doctor2.id, message_text: "second message in thread -- from doctor2")
@message9 = Message.create(message_thread_id: @message_thread_2.id, creator_id: @doctor4.id, message_text: "second message in thread -- from doctor4")

@message10 = Message.create(message_thread_id: @message_thread_3.id, creator_id: @doctor1.id, message_text: "second message in thread -- from doctor1")
@message11 = Message.create(message_thread_id: @message_thread_3.id, creator_id: @doctor1.id, message_text: "second message in thread -- from doctor1")
@message12 = Message.create(message_thread_id: @message_thread_3.id, creator_id: @doctor2.id, message_text: "second message in thread -- from doctor2")
@message13 = Message.create(message_thread_id: @message_thread_3.id, creator_id: @doctor2.id, message_text: "second message in thread -- from doctor2")
@message14 = Message.create(message_thread_id: @message_thread_3.id, creator_id: @doctor4.id, message_text: "second message in thread -- from doctor4")

@message13 = Message.create(message_thread_id: @message_thread_4.id, creator_id: @doctor1.id, message_text: "second message in thread -- from doctor1")
@message14 = Message.create(message_thread_id: @message_thread_4.id, creator_id: @doctor4.id, message_text: "second message in thread -- from doctor4")

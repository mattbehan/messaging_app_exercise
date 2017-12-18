class Message < ApplicationRecord

  after_create {
  	@thread_participants = message_thread.thread_participants.map{|participant| ReadMessage.create(message_id: self.id, user_id: participant.id)}
  	ReadMessage.find_by(message_id: self.id, user_id: self.creator_id).update_column(:read, true)
  }

	belongs_to :message_thread
	belongs_to :creator, class_name: "User"
	has_many :read_messages, inverse_of: :message

	def author
		creator.identifiable.email
	end


	validates :message_thread_id, :creator_id, :message_text, presence: true

end

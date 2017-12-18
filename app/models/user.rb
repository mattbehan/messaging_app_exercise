class User < ApplicationRecord
	belongs_to :identifiable, polymorphic: true

	has_many :messages, foreign_key: "creator_id", inverse_of: :creator
	has_many :read_messages, inverse_of: :message

	def unread_messages_in_message_thread (thread_id)
		Message.where(message_thread_id: thread_id).select{|message| ReadMessage.find_by(message_id: message.id, user_id: self.id).read == false}.count

	end
end

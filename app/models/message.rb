class Message < ApplicationRecord

	belongs_to :message_thread
	belongs_to :author, class_name: "User", foreign_key: "author_id"

	validates :message_thread_id, :author, :message_text, :read_by_recipient, presence: true

end

class ReadMessage < ApplicationRecord
	belongs_to :user
	belongs_to :message

	def mark_as_read
		update_column(:read, true)
	end
end

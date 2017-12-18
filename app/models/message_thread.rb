class MessageThread < ApplicationRecord

	belongs_to :patient
	has_many :patients_care_managers, through: :patient
	has_many :care_managers, through: :patients_care_managers
	has_many :messages, inverse_of: :message_thread
	has_many :read_messages, through: :messages do 
		def per_user user_id
			where(user_id: user_id)
		end
	end

	def thread_participants
		@users = care_managers.map{|care_manager| care_manager.user}
		@users << patient.user
	end

	def mark_users_thread_as_read user_id
		read_messages.per_user(user_id).map{|read_message| read_message.mark_as_read }
	end
end

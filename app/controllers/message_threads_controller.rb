class MessageThreadsController < ApplicationController

	before_action :check_if_user_signed_in, only: [:index, :update]

	def index
		if current_patient
			@message_threads = current_patient.message_thread
		else
			@message_threads = current_care_manager.message_threads
		end
	end

	def update
		MessageThread.find_by(id: params[:id]).mark_users_thread_as_read(current_user.id)
		redirect_to message_threads_path
	end
end

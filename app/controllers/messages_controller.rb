class MessagesController < ApplicationController

	before_action :check_if_user_signed_in, only: [:index, :update]
	before_action only: [:index, :create] do
		ensure_current_user_participates_in_thread(params[:message_thread_id])
	end

	def index
		@message = Message.new
		@messages = Message.where(message_thread_id: params[:message_thread_id])
	end

	def create
		@message = Message.new(creator_id: current_user.id, message_thread_id: params[:message_thread_id], message_text: params[:message][:message_text])
		if @message.save
			redirect_to message_thread_messages_path(params[:message_thread_id])
		else
			flash[:errors] = "Please input text"
			redirect_to message_thread_messages_path(params[:message_thread_id])
		end
	end
end

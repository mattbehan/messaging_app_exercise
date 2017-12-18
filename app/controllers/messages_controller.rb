class MessagesController < ApplicationController
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

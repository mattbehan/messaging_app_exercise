class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :check_if_user_signed_in, :current_user_participates_in_thread?

  def current_user
  	if current_patient
  		current_patient.user
  	elsif current_care_manager
  		current_care_manager.user
  	else
  		false
  	end
  end

  def check_if_user_signed_in
  	if !current_patient && !current_care_manager then authenticate_patient! end
  end

  def ensure_current_user_participates_in_thread thread_id
  	if MessageThread.find_by(id: thread_id).thread_participants.include?(current_user)
  		true
  	else
  		redirect_to message_threads_path
  	end
  end
end

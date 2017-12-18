class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :check_if_user_signed_in

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
end

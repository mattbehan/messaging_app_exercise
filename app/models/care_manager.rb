class CareManager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create {
  	@user = User.create(identifiable_id: self.id, identifiable_type: "CareManager")
  }

  before_destroy {
  	self.user.destroy
  }

  has_one :user, as: :identifiable
  has_many :patients_care_managers, inverse_of: :care_manager
  has_many :patients, through: :patients_care_managers
  has_many :message_threads, through: :patients
  has_many :read_messages, through: :user
  has_many :messages, through: :user

  def unread_messages_in_message_thread (thread_id)
  	@user_id = user.id
  	Message.where(message_thread_id: thread_id).select{|message| ReadMessage.find_by(message_id: message.id, user_id: @user_id).read == false}.count

  end

end

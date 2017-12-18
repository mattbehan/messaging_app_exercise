class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create {
  	@user = User.create(identifiable_id: self.id, identifiable_type: "Patient")
    @message_thread = MessageThread.create(patient_id: self.id)
  }

  before_destroy {
    self.user.destroy
  }

  has_one :user, as: :identifiable  
  has_many :patients_care_managers, inverse_of: :patient
  has_many :care_managers, through: :patients_care_managers
  has_one :message_thread
  has_many :read_messages, through: :user
  has_many :messages, through: :user



end

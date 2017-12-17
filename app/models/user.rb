class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	ROLES = %w(user care_manager)

	validates :role, presence: true,
		inclusion: {in: ROLES, message: "Invalid role" }

	validates :email, presence: true, uniqueness: true 

end

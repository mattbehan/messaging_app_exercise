class MessageThread < ApplicationRecord

	belongs_to :provider, class_name: "User", foreign_key: "provider_id"
	has_many :messages
end

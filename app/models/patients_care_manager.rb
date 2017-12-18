class PatientsCareManager < ApplicationRecord
	belongs_to :patient
	belongs_to :care_manager
end

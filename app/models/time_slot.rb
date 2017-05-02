class TimeSlot < ApplicationRecord
	has_many :schedules, dependent: :destroy
	has_many :sections, :through => :schedules
end

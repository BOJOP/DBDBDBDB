class TimeSlot < ApplicationRecord
	has_many :schedules
	has_many :sections, :through => :schedules
end

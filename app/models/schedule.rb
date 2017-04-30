class Schedule < ApplicationRecord
	belongs_to :section
	belongs_to :time_slot
end

class Event < ApplicationRecord
  has_many :participates
  has_many :groups, :through => :participates

  has_many :competes
  has_many :groups, :through => :competes

end

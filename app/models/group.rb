class Group < ApplicationRecord
  has_many :belong_tos
  has_many :students, :through => :belong_tos

  has_many :participates
  has_many :events, :through => :participates

  has_many :competes
  has_many :events, :through => :competes

  belongs_to :leave
end

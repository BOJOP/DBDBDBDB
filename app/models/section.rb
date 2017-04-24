class Section < ApplicationRecord
  has_many :teaches
  has_many :personnels, :through => :teaches
  belongs_to :course
end

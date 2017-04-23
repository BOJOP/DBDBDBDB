class Section < ApplicationRecord
  has_many :teaches
  belongs_to :course
end

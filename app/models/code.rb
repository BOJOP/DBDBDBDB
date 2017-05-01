class Code < ApplicationRecord
  has_many :courses

  belongs_to :department
end

class Rule < ApplicationRecord
  has_many :log_breaks, dependent: :destroy
  has_many :students, :through => :log_breaks
end

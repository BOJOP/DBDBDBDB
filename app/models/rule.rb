class Rule < ApplicationRecord
  has_many :log_breaks
  has_many :students, :through => :log_breaks
end

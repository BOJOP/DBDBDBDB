class Leave < ApplicationRecord
  belongs_to :group

  has_one :sick_leave
  has_one :personal_leave

end

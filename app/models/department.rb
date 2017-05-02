class Department < ApplicationRecord
  has_many :personnels, class_name: 'Personnel', primary_key: 'id', foreign_key: 'workin_department_id', dependent: :nullify
  has_many :personnels, class_name: 'Personnel', primary_key: 'id', foreign_key: 'manage_department_id', dependent: :nullify
  #has_many :personnels, dependent: :nullify

  has_many :codes
end

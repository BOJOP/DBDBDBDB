class Course < ApplicationRecord
  has_many :sections, dependent: :destroy
  #has_many :enrollment, dependent: :nullify
  has_many :personnels, :through => :sections

  belongs_to :code
end

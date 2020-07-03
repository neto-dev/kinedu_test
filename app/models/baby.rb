class Baby < ApplicationRecord
  has_many :activity_logs
  
  validates :name, presence: true
  validates :birthday, presence: true
  validates :mother_name, presence: true
  validates :father_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end

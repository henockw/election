class Candidate < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :enrollments


  validates :name, presence: true
  validates :description, presence: true
end

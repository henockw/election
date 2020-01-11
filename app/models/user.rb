class User < ApplicationRecord
  has_many :candidates
  has_many :enrollments
  has_many :enrolled_candidates, through: :enrollments, source: :candidate
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(candidate)
    return enrolled_candidates.include?(candidate)
  end
end

class Tournament < ApplicationRecord
  belongs_to :user
  has_many :registrations
  has_many :matchs
  has_many :users, through: :registrations
  has_many :convocations, through: :matchs

  validates :name, presence: true
  validates :city, presence: true
  validates :courts_number, numericality: { only_integer: true }
  validates :begin_at, presence: true
  validates :end_at, presence: true
end

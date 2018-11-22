class Tournament < ApplicationRecord
  belongs_to :supervisor, class_name: 'User'
  has_many :registrations
  has_many :matches
  has_many :users, through: :registrations
  has_many :convocations, through: :matches

  validates :name, presence: true
  validates :city, presence: true
  validates :courts_number, numericality: { only_integer: true }
  validates :begin_at, presence: true
  validates :end_at, presence: true
end

class Tournament < ApplicationRecord
  belongs_to :supervisor, class_name: 'User'
  has_many :registrations
  has_many :matches
  has_many :users, through: :registrations
  has_many :convocations, through: :matches

  validates :name, presence: true
  validates :city, presence: true
  validates :courts_number, numericality: { only_integer: true, greater_than: 0 }
  validates :match_duration, numericality: { only_integer: true }
  validates :begin_at, presence: true
  validates :end_at, presence: true

  mount_uploader :photo, PhotoUploader

  def send_convocations
    self.convocations.each do |convocation|
      convocation.pending! if convocation.to_be_sent? && !convocation.match.begin_at.nil? && !convocation.match.begin_at.nil?
    end
  end
end

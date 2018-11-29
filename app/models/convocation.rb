class Convocation < ApplicationRecord

  belongs_to :match, inverse_of: :convocations
  belongs_to :registration
  delegate :user, to: :registration
  enum status: { to_be_sent: 0, pending: 1, accepted: 2, refused: 3 }

  validates :registration_id, presence: true
  #validates :match_id, presence: true

  scope :pending_ones, -> { where(status: :pending) }
  scope :current_ones, -> { joins(:match).where("matches.begin_at >= ?", DateTime.now)}
end

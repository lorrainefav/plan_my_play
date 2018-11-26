class Convocation < ApplicationRecord

  belongs_to :match, inverse_of: :convocations
  belongs_to :registration
  delegate :user, to: :registration
  enum status: { to_be_sent: 0, pending: 1, accepted: 2, refused: 3 }
end

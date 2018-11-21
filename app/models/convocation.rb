class Convocation < ApplicationRecord
  belongs_to :user
  belongs_to :match

  enum status: { to_be_sent: 0, pending: 1, accepted: 2, refused: 3 }
end

class Match < ApplicationRecord
  belongs_to :tournament
  has_many :convocations
  has_many :users, through: :convocations

end

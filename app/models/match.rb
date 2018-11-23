class Match < ApplicationRecord
  belongs_to :tournament
  has_many :convocations, dependent: :destroy
  has_many :users, through: :convocations

end

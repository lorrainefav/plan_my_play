class Registration < ApplicationRecord

  include PgSearch
  pg_search_scope :filter_players,
    against: [ :category],
    associated_against: {
      user: [:first_name, :last_name, :gender, :ranking]
    },
    using: {
      tsearch: { prefix: true }
    }

  CATEGORIES = ["Senior", "35", "45", "60"]
  RANKING = [ "NC", "40", "30/5", "30/4", "30/3", "30/2", "30/1", "30",\
  "15/5", "15/4", "15/3", "15/2", "15/1", "15", "5/6", "4/6", "3/6", "2/6", "1/6", "0", "-2/6", "-4/6", "-15", "TOP100" ]

  belongs_to :user
  belongs_to :tournament
  has_many :convocations
  has_many :matches, through: :convocations

  validates :user_id, presence: true
  validates :tournament_id, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  # validates :registration_ranking, inclusion: { in: RANKING }

  def to_s
    user
  end
end

class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  validates :user_id, presence: true
  validates :tournament_id, presence: true
  validates :category, presence: true, inclusion: { in: ["Senior", "35", "45", "60"] }
end

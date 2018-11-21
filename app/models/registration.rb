class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  validates :category, presence: true, inclusion: { in: ["Senior", "35", "45", "60"] }
end

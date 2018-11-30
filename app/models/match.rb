class Match < ApplicationRecord
  include PgSearch
  belongs_to :tournament
  has_many :convocations, dependent: :destroy
  has_many :registrations, through: :convocations
  accepts_nested_attributes_for :convocations,
                                reject_if: proc { |attributes| attributes[:registration_id].blank? }

  pg_search_scope :search_by_begin_at, against: [:begin_at], using: { tsearch: { prefix: true } }
  scope :without_court, -> { where(court: nil) }
  scope :without_begin_at, -> { where(begin_at: nil) }
  scope :for_index, -> { without_court.without_begin_at }
end

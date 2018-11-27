class Match < ApplicationRecord
  belongs_to :tournament
  has_many :convocations, dependent: :destroy
  has_many :registrations, through: :convocations
  accepts_nested_attributes_for :convocations,
                                reject_if: proc { |attributes| attributes[:registration_id].blank? }

end

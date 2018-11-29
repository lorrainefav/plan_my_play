class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS = ['Men', 'Women']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tournaments, foreign_key: :supervisor_id
  has_many :availabilities, dependent: :destroy
  has_many :registrations
  has_many :convocations, through: :registrations

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :licence, uniqueness: true, presence: true, length: { is: 9 }
  # validates :gender, inclusion: { in: GENDERS }
  # validates :ranking, inclusion: { in: [ "NC", "40", "30/5", "30/4", "30/3", "30/2", "30/1", "30",\
  # "15/5", "15/4", "15/3", "15/2", "15/1", "15", "5/6", "4/6", "3/6", "2/6", "1/6", "0", "-2/6", "-4/6", "-15", "TOP100" ] }

  def to_s
    "#{first_name} #{last_name}"
  end
end

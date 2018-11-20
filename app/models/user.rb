class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :availabilities
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :club, presence: true
  validates :licence, uniqueness: true, presence: true, length: { is: 8 }
  validates :gender, presence: true, inclusion: { in: [ "men", "women" ] }
  validates :ranking, presence: true, inclusion: { in: [ "NC", "40", "30/5", "30/4", "30/3", "30/2", "30/1", "30",\
  "15/5", "15/4", "15/3", "15/2", "15/1", "15", "5/6", "4/6", "3/6", "2/6", "1/6", "0", "-2/6", "-4/6", "-15", "TOP100" ] }
  validates :phone_number, presence: true
end

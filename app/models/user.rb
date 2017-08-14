class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :horses, dependent: :destroy
  has_many :bookings
  validates :first_name, :last_name, :birth_date, presence: true
  validates :sexe, inclusion: { in: %w(Femme Homme) }
  validates :level, numericality: { only_integer: true }
  has_attachment :photo
end

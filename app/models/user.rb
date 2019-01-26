class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :profile_image, destroy: false

  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: {maximum: 12}
  validates :study_item, presence: true, length: {maximum: 12}
  validates :age, length: {maximum: 3}
  validates :hometown,length: {maximum: 12}
  validates :body,length: {maximum: 200}
end

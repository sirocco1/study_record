class Task < ApplicationRecord
	belongs_to :user

	validates :day, presence: true
	validates :study_time, numericality: true
	validates :study_body, presence: true, length: {maximum: 90}
end

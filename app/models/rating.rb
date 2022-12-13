class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  validates :user_id, :movie_id, :grade, presence: true
  validates :grade, numericality: { in: 1..10}
end

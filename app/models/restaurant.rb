class Restaurant < ApplicationRecord
  belongs_to :event

  validates :yelp_id, presence: true, uniqueness: true
  validates :event_id, presence: true
  validates :votes, presence: true, numericality: true
end

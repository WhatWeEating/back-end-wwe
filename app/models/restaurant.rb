class Restaurant < ApplicationRecord
  belongs_to :event

  validates :yelp_id, presence: true, uniqueness: true
  validates :event_id, presence: true
  validates :votes, numericality: true
end

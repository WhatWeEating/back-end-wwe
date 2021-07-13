class Event < ApplicationRecord
  has_many :restaurants

  validates :uid, presence: true, uniqueness: true
end

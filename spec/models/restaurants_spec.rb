require 'rails_helper'

RSpec.describe Restaurants do
  describe 'relationships' do
    it { should belong_to :events }
  end

  describe 'validations' do
    it { should validate_presence_of :event_id }
    it { should validate_presence_of :yelp_id }
    it { should validate_presence_of :votes }
    
    it { should validate_uniqueness_of :yelp_id }
    it { should validate_numericality_of :votes }
  end
end
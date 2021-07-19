require 'rails_helper'

RSpec.describe Restaurant do
  describe 'relationships' do
    it { should belong_to :event }
  end

  describe 'validations' do
    it { should validate_presence_of :event_id }
    it { should validate_presence_of :yelp_id }
    
    it { should validate_uniqueness_of :yelp_id }
    it { should validate_numericality_of :votes }
  end
end
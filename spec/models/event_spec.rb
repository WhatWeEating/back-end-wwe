require 'rails_helper'

RSpec.describe Event do
  describe 'relationships' do
    it { should have_many :restaurants }
  end

  describe 'validations' do
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
  end
end
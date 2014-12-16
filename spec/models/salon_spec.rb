require 'rails_helper'

RSpec.describe Salon, :type => :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:salon)).to be_valid
  end
  it "is invalid without a name" do
  	expect(FactoryGirl.build(:invalid_salon)).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe Video, :type => :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:video)).to be_valid
  end
  it "is invalid without a valid link" do
  	expect(FactoryGirl.build(:invalid_video)).not_to be_valid
  end
end

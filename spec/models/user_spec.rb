require 'rails_helper'

RSpec.describe Salon, :type => :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:user)).to be_valid
  end
end


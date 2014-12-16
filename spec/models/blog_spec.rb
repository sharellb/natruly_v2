require 'rails_helper'

RSpec.describe Blog, :type => :model do
  it "has a valid factory" do
  	expect(FactoryGirl.create(:blog)).to be_valid
  end
  it "is invalid without a name" do
  	expect(FactoryGirl.build(:invalid_blog)).not_to be_valid
  end
end

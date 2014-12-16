require 'rails_helper'

RSpec.describe "salons/index", :type => :view do
  before(:each) do
    assign(:salons, [
      Salon.create!(
        :address => "Address",
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :phone_number => "Phone Number"
      ),
      Salon.create!(
        :address => "Address",
        :name => "Name",
        :description => "MyText",
        :website => "Website",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of salons" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end

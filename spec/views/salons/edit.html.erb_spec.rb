require 'rails_helper'

RSpec.describe "salons/edit", :type => :view do
  before(:each) do
    @salon = assign(:salon, Salon.create!(
      :address => "MyString",
      :name => "MyString",
      :description => "MyText",
      :website => "MyString",
      :phone_number => "MyString"
    ))
  end

  it "renders the edit salon form" do
    render

    assert_select "form[action=?][method=?]", salon_path(@salon), "post" do

      assert_select "input#salon_address[name=?]", "salon[address]"

      assert_select "input#salon_name[name=?]", "salon[name]"

      assert_select "textarea#salon_description[name=?]", "salon[description]"

      assert_select "input#salon_website[name=?]", "salon[website]"

      assert_select "input#salon_phone_number[name=?]", "salon[phone_number]"
    end
  end
end

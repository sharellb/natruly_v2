require 'rails_helper'

RSpec.describe "salons/show", :type => :view do
  before(:each) do
    @salon = assign(:salon, Salon.create!(
      :address => "Address",
      :name => "Name",
      :description => "MyText",
      :website => "Website",
      :phone_number => "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Phone Number/)
  end
end

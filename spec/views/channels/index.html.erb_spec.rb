require 'rails_helper'

RSpec.describe "channels/index", :type => :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :username => "Username"
      ),
      Channel.create!(
        :username => "Username"
      )
    ])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
  end
end

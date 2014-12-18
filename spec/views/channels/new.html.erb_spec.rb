require 'rails_helper'

RSpec.describe "channels/new", :type => :view do
  before(:each) do
    assign(:channel, Channel.new(
      :username => "MyString"
    ))
  end

  it "renders new channel form" do
    render

    assert_select "form[action=?][method=?]", channels_path, "post" do

      assert_select "input#channel_username[name=?]", "channel[username]"
    end
  end
end

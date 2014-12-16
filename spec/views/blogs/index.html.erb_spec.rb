require 'rails_helper'

RSpec.describe "blogs/index", :type => :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :feed => "Feed"
      ),
      Blog.create!(
        :feed => "Feed"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "Feed".to_s, :count => 2
  end
end

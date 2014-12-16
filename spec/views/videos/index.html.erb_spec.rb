require 'rails_helper'

RSpec.describe "videos/index", :type => :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :link => "Link",
        :title => "Title",
        :author => "Author",
        :duration => "Duration",
        :likes => 1,
        :dislikes => 2,
        :uid => "Uid"
      ),
      Video.create!(
        :link => "Link",
        :title => "Title",
        :author => "Author",
        :duration => "Duration",
        :likes => 1,
        :dislikes => 2,
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Duration".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end

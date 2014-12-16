require 'rails_helper'

RSpec.describe "videos/edit", :type => :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :link => "MyString",
      :title => "MyString",
      :author => "MyString",
      :duration => "MyString",
      :likes => 1,
      :dislikes => 1,
      :uid => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "input#video_link[name=?]", "video[link]"

      assert_select "input#video_title[name=?]", "video[title]"

      assert_select "input#video_author[name=?]", "video[author]"

      assert_select "input#video_duration[name=?]", "video[duration]"

      assert_select "input#video_likes[name=?]", "video[likes]"

      assert_select "input#video_dislikes[name=?]", "video[dislikes]"

      assert_select "input#video_uid[name=?]", "video[uid]"
    end
  end
end

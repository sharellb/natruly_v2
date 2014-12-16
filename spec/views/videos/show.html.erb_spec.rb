require 'rails_helper'

RSpec.describe "videos/show", :type => :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :link => "Link",
      :title => "Title",
      :author => "Author",
      :duration => "Duration",
      :likes => 1,
      :dislikes => 2,
      :uid => "Uid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Duration/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Uid/)
  end
end

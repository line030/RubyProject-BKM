require 'spec_helper'

describe "exercises/show" do
  before(:each) do
    @exercise = assign(:exercise, stub_model(Exercise,
      :name => "Name",
      :description => "MyText",
      :picture => "Picture",
      :points => 1,
      :unit_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Picture/)
    rendered.should match(/1/)
    rendered.should match(/Unit/)
  end
end

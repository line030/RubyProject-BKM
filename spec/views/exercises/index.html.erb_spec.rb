require 'spec_helper'

describe "exercises/index" do
  before(:each) do
    assign(:exercises, [
      stub_model(Exercise,
        :name => "Name",
        :description => "MyText",
        :picture => "Picture",
        :points => 1,
        :unit_id => 1
      ),
      stub_model(Exercise,
        :name => "Name",
        :description => "MyText",
        :picture => "Picture",
        :points => 1,
        :unit_id => 1
      )
    ])
  end

  it "renders a list of exercises" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

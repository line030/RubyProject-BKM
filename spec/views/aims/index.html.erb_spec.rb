require 'spec_helper'

describe "aims/index" do
  before(:each) do
    assign(:aims, [
      stub_model(Aim,
        :name => "Name1",
        :value => 5,
        :category_id => 1
      ),
      stub_model(Aim,
        :name => "Name2",
        :value => 5,
        :category_id => 1
      )
    ])
  end

  it "renders a list of aims" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

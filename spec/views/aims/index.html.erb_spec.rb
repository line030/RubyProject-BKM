require 'spec_helper'

describe "aims/index" do
  before(:each) do
    assign(:aims, [
      stub_model(Aim,
        :value => "Value",
        : => ""
      ),
      stub_model(Aim,
        :value => "Value",
        : => ""
      )
    ])
  end

  it "renders a list of aims" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

require 'spec_helper'

describe "aim_progresses/index" do
  before(:each) do
    assign(:aim_progresses, [
      stub_model(AimProgress,
        :value => 1,
        :aim_id => 2
      ),
      stub_model(AimProgress,
        :value => 1,
        :aim_id => 2
      )
    ])
  end

  it "renders a list of aim_progresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

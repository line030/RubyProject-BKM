require 'spec_helper'

describe "aim_progresses/show" do
  before(:each) do
    @aim_progress = assign(:aim_progress, stub_model(AimProgress,
      :value => 1,
      :aim_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end

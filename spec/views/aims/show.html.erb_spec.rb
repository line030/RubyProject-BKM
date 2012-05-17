require 'spec_helper'

describe "aims/show" do
  before(:each) do
    @aim = assign(:aim, stub_model(Aim,
      :value => "Value",
      : => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    rendered.should match(//)
  end
end

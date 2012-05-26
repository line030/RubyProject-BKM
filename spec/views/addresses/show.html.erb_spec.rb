require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :street => "Street",
      :zip => "Zip",
      :country_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street/)
    rendered.should match(/Zip/)
    rendered.should match(/1/)
  end
end

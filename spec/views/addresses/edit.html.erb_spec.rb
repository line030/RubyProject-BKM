require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :street => "MyString",
      :zip => "MyString",
      :country_id => 1
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path(@address), :method => "post" do
      assert_select "input#address_street", :name => "address[street]"
      assert_select "input#address_zip", :name => "address[zip]"
      assert_select "input#address_country_id", :name => "address[country_id]"
    end
  end
end

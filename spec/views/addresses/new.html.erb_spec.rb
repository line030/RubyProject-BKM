require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :street => "MyString",
      :zip => "MyString",
      :country_id => 1
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path, :method => "post" do
      assert_select "input#address_street", :name => "address[street]"
      assert_select "input#address_zip", :name => "address[zip]"
      assert_select "input#address_country_id", :name => "address[country_id]"
    end
  end
end

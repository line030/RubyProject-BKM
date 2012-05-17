require 'spec_helper'

describe "aims/new" do
  before(:each) do
    assign(:aim, stub_model(Aim,
      :value => "MyString",
      : => ""
    ).as_new_record)
  end

  it "renders new aim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aims_path, :method => "post" do
      assert_select "input#aim_value", :name => "aim[value]"
      assert_select "input#aim_", :name => "aim[]"
    end
  end
end

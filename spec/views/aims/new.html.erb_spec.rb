require 'spec_helper'

describe "aims/new" do
  before(:each) do

    assign(:category_selection_list,[])

    assign(:aim, stub_model(Aim,
      :name => "MyAim1",
      :value => 5,
      :category_id => 1
    ).as_new_record)
  end

  it "renders new aim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aims_path, :method => "post" do
      assert_select "input#aim_name", :name => "aim[name]"
      assert_select "input#aim_value", :name => "aim[value]"
#      assert_select "input#aim_category_id", :name => "aim[category_id]"
    end
  end
end

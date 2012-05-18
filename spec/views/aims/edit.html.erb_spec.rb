require 'spec_helper'

describe "aims/edit" do
  before(:each) do
    @aim = assign(:aim, stub_model(Aim,
      :name => "MyGoal",
      :value => 5,
      :category_id => 1
    ))
  end

  it "renders the edit aim form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aims_path(@aim), :method => "post" do
      assert_select "input#aim_value", :name => "aim[name]"
      assert_select "input#aim_name", :name => "aim[value]"
      assert_select "input#aim_category_id", :name => "aim[category_id]"
    end
  end
end

require 'spec_helper'

describe "exercises/new" do
  before(:each) do
    assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString",
      :points => 1,
      :unit_id => 1
    ).as_new_record)
  end

  it "renders new exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exercises_path, :method => "post" do
      assert_select "input#exercise_name", :name => "exercise[name]"
      assert_select "textarea#exercise_description", :name => "exercise[description]"
      assert_select "input#exercise_picture", :name => "exercise[picture]"
      assert_select "input#exercise_points", :name => "exercise[points]"
      assert_select "input#exercise_unit_id", :name => "exercise[unit_id]"
    end
  end
end

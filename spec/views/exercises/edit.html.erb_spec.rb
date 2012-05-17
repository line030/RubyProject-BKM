require 'spec_helper'

describe "exercises/edit" do
  before(:each) do
    @exercise = assign(:exercise, stub_model(Exercise,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString",
      :points => 1,
      :unit => "MyString"
    ))
  end

  it "renders the edit exercise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => exercises_path(@exercise), :method => "post" do
      assert_select "input#exercise_name", :name => "exercise[name]"
      assert_select "textarea#exercise_description", :name => "exercise[description]"
      assert_select "input#exercise_picture", :name => "exercise[picture]"
      assert_select "input#exercise_points", :name => "exercise[points]"
      assert_select "input#exercise_unit", :name => "exercise[unit]"
    end
  end
end

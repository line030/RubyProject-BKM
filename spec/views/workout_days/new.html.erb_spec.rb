require 'spec_helper'

describe "workout_days/new" do
  before(:each) do
    assign(:workout_day, stub_model(WorkoutDay,
      :day => "MyString"
    ).as_new_record)
  end

  it "renders new workout_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_days_path, :method => "post" do
      assert_select "input#workout_day_day", :name => "workout_day[day]"
    end
  end
end

require 'spec_helper'

describe "workout_days/edit" do
  before(:each) do
    @workout_day = assign(:workout_day, stub_model(WorkoutDay,
      :day => "MyString",
      :workout_plan_id => 1
    ))
  end

  it "renders the edit workout_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_days_path(@workout_day), :method => "post" do
      assert_select "input#workout_day_day", :name => "workout_day[day]"
      assert_select "input#workout_day_workout_plan_id", :name => "workout_day[workout_plan_id]"
    end
  end
end

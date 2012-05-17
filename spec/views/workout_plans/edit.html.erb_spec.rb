require 'spec_helper'

describe "workout_plans/edit" do
  before(:each) do
    @workout_plan = assign(:workout_plan, stub_model(WorkoutPlan,
      :name => "MyString"
    ))
  end

  it "renders the edit workout_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_plans_path(@workout_plan), :method => "post" do
      assert_select "input#workout_plan_name", :name => "workout_plan[name]"
    end
  end
end

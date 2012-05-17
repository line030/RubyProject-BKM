require 'spec_helper'

describe "workout_plans/new" do
  before(:each) do
    assign(:workout_plan, stub_model(WorkoutPlan,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new workout_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_plans_path, :method => "post" do
      assert_select "input#workout_plan_name", :name => "workout_plan[name]"
    end
  end
end

require 'spec_helper'

describe "workout_plans/show" do
  before(:each) do
    @workout_plan = assign(:workout_plan, stub_model(WorkoutPlan,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

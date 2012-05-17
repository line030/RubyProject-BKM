require 'spec_helper'

describe "workout_sessions/index" do
  before(:each) do
    assign(:workout_sessions, [
      stub_model(WorkoutSession),
      stub_model(WorkoutSession)
    ])
  end

  it "renders a list of workout_sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

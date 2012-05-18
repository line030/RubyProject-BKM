require 'spec_helper'

describe "workout_sessions/show" do
  before(:each) do
    @workout_session = assign(:workout_session, stub_model(WorkoutSession,
                                                           :date => "2012-05-18 12:46:14.717753",
                                                           :workout_day_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Date/)
    rendered.should match(/Workout_day/)
  end
end

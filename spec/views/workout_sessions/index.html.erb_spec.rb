require 'spec_helper'

describe "workout_sessions/index" do
  before(:each) do

    @workout_session = assign(:workout_session, stub_model(WorkoutSession,
                                                           :date => "2012-05-18 12:46:14.717753",
                                                           :workout_day_id => 1
    ))

    @workout_session = assign(:workout_session, stub_model(WorkoutSession,
                                                           :date => "2012-05-18 12:46:14.717753",
                                                           :workout_day_id => 1
    ))

  end

  it "renders a list of workout_sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => date.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

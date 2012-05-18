require 'spec_helper'

describe "workout_sessions/edit" do
  before(:each) do
    @workout_session = assign(:workout_session, stub_model(WorkoutSession,
      :date => "2012-05-18 12:46:14.717753",
      :workout_day_id => 1
    ))


  end

  it "renders the edit workout_session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_sessions_path(@workout_session), :method => "post" do
      assert_select "input#workout_session_date", :name => "workout_session[date]"
      assert_select "textarea#workout_session_workout_day_id", :name => "exercise[workout_day_id]"
    end
  end
end

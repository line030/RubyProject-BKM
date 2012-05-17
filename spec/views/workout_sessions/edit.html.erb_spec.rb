require 'spec_helper'

describe "workout_sessions/edit" do
  before(:each) do
    @workout_session = assign(:workout_session, stub_model(WorkoutSession))
  end

  it "renders the edit workout_session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_sessions_path(@workout_session), :method => "post" do
    end
  end
end

require 'spec_helper'

describe "workout_sessions/new" do
  before(:each) do
    assign(:workout_session, stub_model(WorkoutSession).as_new_record)
  end

  it "renders new workout_session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_sessions_path, :method => "post" do
    end
  end
end

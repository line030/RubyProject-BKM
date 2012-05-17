require 'spec_helper'

describe "workout_days/show" do
  before(:each) do
    @workout_day = assign(:workout_day, stub_model(WorkoutDay,
      :day => "Day"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Day/)
  end
end

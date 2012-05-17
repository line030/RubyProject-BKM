require 'spec_helper'

describe "workout_days/index" do
  before(:each) do
    assign(:workout_days, [
      stub_model(WorkoutDay,
        :day => "Day"
      ),
      stub_model(WorkoutDay,
        :day => "Day"
      )
    ])
  end

  it "renders a list of workout_days" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Day".to_s, :count => 2
  end
end

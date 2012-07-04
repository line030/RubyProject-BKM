require 'spec_helper'

describe "aim_progresses/new" do
  before(:each) do
    assign(:aim_progress, stub_model(AimProgress,
      :value => 1,
      :aim_id => 1
    ).as_new_record)
  end

  it "renders new aim_progress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => aim_progresses_path, :method => "post" do
      assert_select "input#aim_progress_value", :name => "aim_progress[value]"
      assert_select "input#aim_progress_aim_id", :name => "aim_progress[aim_id]"
    end
  end
end

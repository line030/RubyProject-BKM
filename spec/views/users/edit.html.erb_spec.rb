require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "MyString",
      :email => "MyString",
      :persistence_token => "MyString",
      :crypted_password => "MyString",
      :password_salt => "MyString",
      :single_access_token => "MyString",
      :perishable_token => "MyString",
      :login_count => 1,
      :failed_login_count => 1,
      :current_login_ip => "MyString",
      :last_login_ip => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_login", :name => "user[login]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_persistence_token", :name => "user[persistence_token]"
      assert_select "input#user_crypted_password", :name => "user[crypted_password]"
      assert_select "input#user_password_salt", :name => "user[password_salt]"
      assert_select "input#user_single_access_token", :name => "user[single_access_token]"
      assert_select "input#user_perishable_token", :name => "user[perishable_token]"
      assert_select "input#user_login_count", :name => "user[login_count]"
      assert_select "input#user_failed_login_count", :name => "user[failed_login_count]"
      assert_select "input#user_current_login_ip", :name => "user[current_login_ip]"
      assert_select "input#user_last_login_ip", :name => "user[last_login_ip]"
    end
  end
end

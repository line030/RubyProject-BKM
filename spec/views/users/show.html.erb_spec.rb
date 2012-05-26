require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :login => "Login",
      :email => "Email",
      :persistence_token => "Persistence Token",
      :crypted_password => "Crypted Password",
      :password_salt => "Password Salt",
      :single_access_token => "Single Access Token",
      :perishable_token => "Perishable Token",
      :login_count => 1,
      :failed_login_count => 2,
      :current_login_ip => "Current Login Ip",
      :last_login_ip => "Last Login Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Login/)
    rendered.should match(/Email/)
    rendered.should match(/Persistence Token/)
    rendered.should match(/Crypted Password/)
    rendered.should match(/Password Salt/)
    rendered.should match(/Single Access Token/)
    rendered.should match(/Perishable Token/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Current Login Ip/)
    rendered.should match(/Last Login Ip/)
  end
end

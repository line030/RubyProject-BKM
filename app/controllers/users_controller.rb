class UsersController < ApplicationController

  # make session if not authenticated ?
  before_filter :authenticate
  skip_before_filter :authenticate, :only => [:new,:create,:check_email,:check_username]

  #before_create { generate_token(:auth_token) }

  def send_password_reset
    #puts "DENIZ: SendPassword pressed"
    #generate_token(:password_reset_token)
    #self.password_reset_sent_at = Time.zone.now
    #save!
    #UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    @workout_plans = @user.workout_plans

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def assign_workout_plans_selection_list
    @workout_plans_selection_list = WorkoutPlan.all.collect { |workoutP|
      [workoutP.name, workoutP.id]
    }
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

   # @address = Address.create
   # @user.address = @address

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def get_country_selection_list
    Country.all.collect {|country| [ country.name, country.id ] }
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:password].nil?
      params[:user][:password] = "password"
      params[:user][:password_confirmation] = "password"
    end

    @user = User.new(params[:user])

    #@user.gender = params[:gender]

    #createn einer leeren Address
    @address = Address.create
    @user.address = @address

    #render :text => @user.gender , :layout => false
    #return

    respond_to do |format|
      if @user.save
        format.html { redirect_to dashboard_path, notice: 'Welcome to Bodykit.Me!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if (@user.update_attributes(params[:user]) &&  @user.address.update_attributes(params[:address]))

        format.html { redirect_to edit_user_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  # TODO: CSRXF-Attacks
  # POST /users/check_email
  def check_username
    @user = User.find_by_login(params[:user][:login])

    respond_to do | format |
      format.json { render :json => !@user}
    end
  end

  # TODO: CSRXF-Attacks
  # POST /users/check_email
  def check_email
    #render :text => "hallo" , :layout => false
    #return
    @user = User.find_by_email(params[:user][:email])

    respond_to do | format |
      format.json { render :json => !@user}
    end
  end
end

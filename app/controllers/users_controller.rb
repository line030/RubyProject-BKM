class UsersController < ApplicationController

  # make session if not authenticated ?
  skip_before_filter :authenticate, :only => [:new,:create, :index]



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

    assign_workout_plans_selection_list

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    assign_country_selection_list

    # handling of the radio button

  end

  def assign_country_selection_list

    @country_selection_list = Country.all.collect {|country| [ country.name, country.id ] }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    @user.gender = params[:gender]

    #createn einer leeren Address
    @address = Address.create
    @user.address = @address

    #render :text => params[:gender] , :layout => false
    #return

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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

    #render :text => params[:gender] , :layout => false
    #return
    @user.gender = params[:gender]

    respond_to do |format|
      if (@user.update_attributes(params[:user]) &&  @user.address.update_attributes(params[:address]))

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
end

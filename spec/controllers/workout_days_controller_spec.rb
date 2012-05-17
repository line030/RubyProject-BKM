require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WorkoutDaysController do

  # This should return the minimal set of attributes required to create a valid
  # WorkoutDay. As you add validations to WorkoutDay, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkoutDaysController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all workout_days as @workout_days" do
      workout_day = WorkoutDay.create! valid_attributes
      get :index, {}, valid_session
      assigns(:workout_days).should eq([workout_day])
    end
  end

  describe "GET show" do
    it "assigns the requested workout_day as @workout_day" do
      workout_day = WorkoutDay.create! valid_attributes
      get :show, {:id => workout_day.to_param}, valid_session
      assigns(:workout_day).should eq(workout_day)
    end
  end

  describe "GET new" do
    it "assigns a new workout_day as @workout_day" do
      get :new, {}, valid_session
      assigns(:workout_day).should be_a_new(WorkoutDay)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_day as @workout_day" do
      workout_day = WorkoutDay.create! valid_attributes
      get :edit, {:id => workout_day.to_param}, valid_session
      assigns(:workout_day).should eq(workout_day)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WorkoutDay" do
        expect {
          post :create, {:workout_day => valid_attributes}, valid_session
        }.to change(WorkoutDay, :count).by(1)
      end

      it "assigns a newly created workout_day as @workout_day" do
        post :create, {:workout_day => valid_attributes}, valid_session
        assigns(:workout_day).should be_a(WorkoutDay)
        assigns(:workout_day).should be_persisted
      end

      it "redirects to the created workout_day" do
        post :create, {:workout_day => valid_attributes}, valid_session
        response.should redirect_to(WorkoutDay.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout_day as @workout_day" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutDay.any_instance.stub(:save).and_return(false)
        post :create, {:workout_day => {}}, valid_session
        assigns(:workout_day).should be_a_new(WorkoutDay)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutDay.any_instance.stub(:save).and_return(false)
        post :create, {:workout_day => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested workout_day" do
        workout_day = WorkoutDay.create! valid_attributes
        # Assuming there are no other workout_days in the database, this
        # specifies that the WorkoutDay created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WorkoutDay.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => workout_day.to_param, :workout_day => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested workout_day as @workout_day" do
        workout_day = WorkoutDay.create! valid_attributes
        put :update, {:id => workout_day.to_param, :workout_day => valid_attributes}, valid_session
        assigns(:workout_day).should eq(workout_day)
      end

      it "redirects to the workout_day" do
        workout_day = WorkoutDay.create! valid_attributes
        put :update, {:id => workout_day.to_param, :workout_day => valid_attributes}, valid_session
        response.should redirect_to(workout_day)
      end
    end

    describe "with invalid params" do
      it "assigns the workout_day as @workout_day" do
        workout_day = WorkoutDay.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutDay.any_instance.stub(:save).and_return(false)
        put :update, {:id => workout_day.to_param, :workout_day => {}}, valid_session
        assigns(:workout_day).should eq(workout_day)
      end

      it "re-renders the 'edit' template" do
        workout_day = WorkoutDay.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutDay.any_instance.stub(:save).and_return(false)
        put :update, {:id => workout_day.to_param, :workout_day => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workout_day" do
      workout_day = WorkoutDay.create! valid_attributes
      expect {
        delete :destroy, {:id => workout_day.to_param}, valid_session
      }.to change(WorkoutDay, :count).by(-1)
    end

    it "redirects to the workout_days list" do
      workout_day = WorkoutDay.create! valid_attributes
      delete :destroy, {:id => workout_day.to_param}, valid_session
      response.should redirect_to(workout_days_url)
    end
  end

end

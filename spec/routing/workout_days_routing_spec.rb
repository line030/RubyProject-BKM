require "spec_helper"

describe WorkoutDaysController do
  describe "routing" do

    it "routes to #index" do
      get("/workout_days").should route_to("workout_days#index")
    end

    it "routes to #new" do
      get("/workout_days/new").should route_to("workout_days#new")
    end

    it "routes to #show" do
      get("/workout_days/1").should route_to("workout_days#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workout_days/1/edit").should route_to("workout_days#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workout_days").should route_to("workout_days#create")
    end

    it "routes to #update" do
      put("/workout_days/1").should route_to("workout_days#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workout_days/1").should route_to("workout_days#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe WorkoutPlansController do
  describe "routing" do

    it "routes to #index" do
      get("/workout_plans").should route_to("workout_plans#index")
    end

    it "routes to #new" do
      get("/workout_plans/new").should route_to("workout_plans#new")
    end

    it "routes to #show" do
      get("/workout_plans/1").should route_to("workout_plans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workout_plans/1/edit").should route_to("workout_plans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workout_plans").should route_to("workout_plans#create")
    end

    it "routes to #update" do
      put("/workout_plans/1").should route_to("workout_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workout_plans/1").should route_to("workout_plans#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe AimProgressesController do
  describe "routing" do

    it "routes to #index" do
      get("/aim_progresses").should route_to("aim_progresses#index")
    end

    it "routes to #new" do
      get("/aim_progresses/new").should route_to("aim_progresses#new")
    end

    it "routes to #show" do
      get("/aim_progresses/1").should route_to("aim_progresses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aim_progresses/1/edit").should route_to("aim_progresses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aim_progresses").should route_to("aim_progresses#create")
    end

    it "routes to #update" do
      put("/aim_progresses/1").should route_to("aim_progresses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aim_progresses/1").should route_to("aim_progresses#destroy", :id => "1")
    end

  end
end

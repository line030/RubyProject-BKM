require "spec_helper"

describe AimsController do
  describe "routing" do

    it "routes to #index" do
      get("/aims").should route_to("aims#index")
    end

    it "routes to #new" do
      get("/aims/new").should route_to("aims#new")
    end

    it "routes to #show" do
      get("/aims/1").should route_to("aims#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aims/1/edit").should route_to("aims#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aims").should route_to("aims#create")
    end

    it "routes to #update" do
      put("/aims/1").should route_to("aims#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aims/1").should route_to("aims#destroy", :id => "1")
    end

  end
end

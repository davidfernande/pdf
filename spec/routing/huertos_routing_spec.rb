require "spec_helper"

describe HuertosController do
  describe "routing" do

    it "routes to #index" do
      get("/huertos").should route_to("huertos#index")
    end

    it "routes to #new" do
      get("/huertos/new").should route_to("huertos#new")
    end

    it "routes to #show" do
      get("/huertos/1").should route_to("huertos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/huertos/1/edit").should route_to("huertos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/huertos").should route_to("huertos#create")
    end

    it "routes to #update" do
      put("/huertos/1").should route_to("huertos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/huertos/1").should route_to("huertos#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe PlantaController do
  describe "routing" do

    it "routes to #index" do
      get("/planta").should route_to("planta#index")
    end

    it "routes to #new" do
      get("/planta/new").should route_to("planta#new")
    end

    it "routes to #show" do
      get("/planta/1").should route_to("planta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/planta/1/edit").should route_to("planta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/planta").should route_to("planta#create")
    end

    it "routes to #update" do
      put("/planta/1").should route_to("planta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/planta/1").should route_to("planta#destroy", :id => "1")
    end

  end
end

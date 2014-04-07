require "spec_helper"

describe PruebasController do
  describe "routing" do

    it "routes to #index" do
      get("/pruebas").should route_to("pruebas#index")
    end

    it "routes to #new" do
      get("/pruebas/new").should route_to("pruebas#new")
    end

    it "routes to #show" do
      get("/pruebas/1").should route_to("pruebas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pruebas/1/edit").should route_to("pruebas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pruebas").should route_to("pruebas#create")
    end

    it "routes to #update" do
      put("/pruebas/1").should route_to("pruebas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pruebas/1").should route_to("pruebas#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe PrecontratosController do
  describe "routing" do

    it "routes to #index" do
      get("/precontratos").should route_to("precontratos#index")
    end

    it "routes to #new" do
      get("/precontratos/new").should route_to("precontratos#new")
    end

    it "routes to #show" do
      get("/precontratos/1").should route_to("precontratos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/precontratos/1/edit").should route_to("precontratos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/precontratos").should route_to("precontratos#create")
    end

    it "routes to #update" do
      put("/precontratos/1").should route_to("precontratos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/precontratos/1").should route_to("precontratos#destroy", :id => "1")
    end

  end
end

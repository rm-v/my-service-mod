require "spec_helper"

describe SlipLinesController do
  describe "routing" do

    it "routes to #index" do
      get("/slip_lines").should route_to("slip_lines#index")
    end

    it "routes to #new" do
      get("/slip_lines/new").should route_to("slip_lines#new")
    end

    it "routes to #show" do
      get("/slip_lines/1").should route_to("slip_lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/slip_lines/1/edit").should route_to("slip_lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/slip_lines").should route_to("slip_lines#create")
    end

    it "routes to #update" do
      put("/slip_lines/1").should route_to("slip_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/slip_lines/1").should route_to("slip_lines#destroy", :id => "1")
    end

  end
end

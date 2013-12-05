require "spec_helper"

describe SlipPaymentsController do
  describe "routing" do

    it "routes to #index" do
      get("/slip_payments").should route_to("slip_payments#index")
    end

    it "routes to #new" do
      get("/slip_payments/new").should route_to("slip_payments#new")
    end

    it "routes to #show" do
      get("/slip_payments/1").should route_to("slip_payments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/slip_payments/1/edit").should route_to("slip_payments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/slip_payments").should route_to("slip_payments#create")
    end

    it "routes to #update" do
      put("/slip_payments/1").should route_to("slip_payments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/slip_payments/1").should route_to("slip_payments#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe SalonsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/salons").to route_to("salons#index")
    end

    it "routes to #new" do
      expect(:get => "/salons/new").to route_to("salons#new")
    end

    it "routes to #show" do
      expect(:get => "/salons/1").to route_to("salons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/salons/1/edit").to route_to("salons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/salons").to route_to("salons#create")
    end

    it "routes to #update" do
      expect(:put => "/salons/1").to route_to("salons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/salons/1").to route_to("salons#destroy", :id => "1")
    end

  end
end

require 'rails_helper'

RSpec.describe SalonsController, :type => :controller do

  describe "GET index" do
    it "assigns all salons as @salons" do
      salon = FactoryGirl.create(:salon)
      get :index
      expect(assigns(:salons)).to eq([salon])
    end
  end

  describe "GET show" do
    it "assigns the requested salon as @salon" do
      salon = FactoryGirl.create(:salon)
      get :show, {:id => salon.to_param}
      expect(assigns(:salon)).to eq(salon)
    end
  end

  describe "GET new" do
    it "assigns a new salon as @salon" do
      get :new
      expect(assigns(:salon)).to be_a_new(Salon)
    end
  end

  describe "GET edit" do
    it "assigns the requested salon as @salon" do
      salon = FactoryGirl.create(:salon)
      get :edit, {:id => salon.to_param}
      expect(assigns(:salon)).to eq(salon)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Salon" do
        expect {
          post :create, {:salon => FactoryGirl.attributes_for(:salon)}
        }.to change(Salon, :count).by(1)
      end

      it "assigns a newly created salon as @salon" do
        post :create, {:salon => FactoryGirl.attributes_for(:salon)}
        expect(assigns(:salon)).to be_a(Salon)
        expect(assigns(:salon)).to be_persisted
      end

      it "redirects to the created salon" do
        post :create, {:salon => FactoryGirl.attributes_for(:salon)}
        expect(response).to redirect_to(Salon.last)
      end
    end

    describe "with invalid params" do
      it "does not create a new salon" do
        expect {
          post :create, {:salon => FactoryGirl.attributes_for(:invalid_salon)}
        }.to_not change(Salon, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:salon => FactoryGirl.attributes_for(:invalid_salon)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do

    before :each do
      @salon = FactoryGirl.create(:salon) 
    end

    describe "with valid params" do
      before :each do
        put :update, {:id => @salon.to_param, :salon => FactoryGirl.attributes_for(:updated_salon)}
      end

      it "updates the requested salon" do
        @salon.reload
      end

      it "assigns the requested salon as @salon" do
        expect(assigns(:salon)).to eq(@salon)
      end

      it "redirects to the salon" do
        expect(response).to redirect_to(@salon)
      end
    end

    describe "with invalid params" do
      it "assigns the salon as @salon" do
        put :update, {:id => @salon.to_param, :salon => FactoryGirl.attributes_for(:invalid_salon)}
        expect(assigns(:salon)).to eq(@salon)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @salon.to_param, :salon => FactoryGirl.attributes_for(:invalid_salon)}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested salon" do
      salon = FactoryGirl.create(:salon)
      expect {
        delete :destroy, {:id => salon.to_param}
      }.to change(Salon, :count).by(-1)
    end

    it "redirects to the salons list" do
      salon = FactoryGirl.create(:salon)
      delete :destroy, {:id => salon.to_param}
      expect(response).to redirect_to(salons_url)
    end
  end

end

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ChannelsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Channel. As you add validations to Channel, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ChannelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all channels as @channels" do
      channel = Channel.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:channels)).to eq([channel])
    end
  end

  describe "GET show" do
    it "assigns the requested channel as @channel" do
      channel = Channel.create! valid_attributes
      get :show, {:id => channel.to_param}, valid_session
      expect(assigns(:channel)).to eq(channel)
    end
  end

  describe "GET new" do
    it "assigns a new channel as @channel" do
      get :new, {}, valid_session
      expect(assigns(:channel)).to be_a_new(Channel)
    end
  end

  describe "GET edit" do
    it "assigns the requested channel as @channel" do
      channel = Channel.create! valid_attributes
      get :edit, {:id => channel.to_param}, valid_session
      expect(assigns(:channel)).to eq(channel)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Channel" do
        expect {
          post :create, {:channel => valid_attributes}, valid_session
        }.to change(Channel, :count).by(1)
      end

      it "assigns a newly created channel as @channel" do
        post :create, {:channel => valid_attributes}, valid_session
        expect(assigns(:channel)).to be_a(Channel)
        expect(assigns(:channel)).to be_persisted
      end

      it "redirects to the created channel" do
        post :create, {:channel => valid_attributes}, valid_session
        expect(response).to redirect_to(Channel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved channel as @channel" do
        post :create, {:channel => invalid_attributes}, valid_session
        expect(assigns(:channel)).to be_a_new(Channel)
      end

      it "re-renders the 'new' template" do
        post :create, {:channel => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested channel" do
        channel = Channel.create! valid_attributes
        put :update, {:id => channel.to_param, :channel => new_attributes}, valid_session
        channel.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested channel as @channel" do
        channel = Channel.create! valid_attributes
        put :update, {:id => channel.to_param, :channel => valid_attributes}, valid_session
        expect(assigns(:channel)).to eq(channel)
      end

      it "redirects to the channel" do
        channel = Channel.create! valid_attributes
        put :update, {:id => channel.to_param, :channel => valid_attributes}, valid_session
        expect(response).to redirect_to(channel)
      end
    end

    describe "with invalid params" do
      it "assigns the channel as @channel" do
        channel = Channel.create! valid_attributes
        put :update, {:id => channel.to_param, :channel => invalid_attributes}, valid_session
        expect(assigns(:channel)).to eq(channel)
      end

      it "re-renders the 'edit' template" do
        channel = Channel.create! valid_attributes
        put :update, {:id => channel.to_param, :channel => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested channel" do
      channel = Channel.create! valid_attributes
      expect {
        delete :destroy, {:id => channel.to_param}, valid_session
      }.to change(Channel, :count).by(-1)
    end

    it "redirects to the channels list" do
      channel = Channel.create! valid_attributes
      delete :destroy, {:id => channel.to_param}, valid_session
      expect(response).to redirect_to(channels_url)
    end
  end

end

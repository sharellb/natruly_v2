require 'rails_helper'

RSpec.describe VideosController, :type => :controller do

  describe "GET index" do
    it "assigns all videos as @videos" do
      video = FactoryGirl.create(:video)
      get :index
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe "GET show" do
    it "assigns the requested video as @video" do
      video = FactoryGirl.create(:video)
      get :show, {:id => video.to_param}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "GET new" do
    it "assigns a new video as @video" do
      get :new
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

  describe "GET edit" do
    it "assigns the requested video as @video" do
      video = FactoryGirl.create(:video)
      get :edit, {:id => video.to_param}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new video" do
        expect {
          post :create, {:video => FactoryGirl.attributes_for(:video)}
        }.to change(Video, :count).by(1)
      end

      it "assigns a newly created video as @video" do
        post :create, {:video => FactoryGirl.attributes_for(:video)}
        expect(assigns(:video)).to be_a(Video)
        expect(assigns(:video)).to be_persisted
      end

      it "redirects to the created video" do
        post :create, {:video => FactoryGirl.attributes_for(:video)}
        expect(response).to redirect_to(Video.last)
      end
    end

    describe "with invalid params" do
      it "does not create a new video" do
        expect {
          post :create, {:video => FactoryGirl.attributes_for(:invalid_video)}
        }.to_not change(Video, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:video => FactoryGirl.attributes_for(:invalid_video)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do

    before :each do
      @video = FactoryGirl.create(:video) 
    end

    describe "with valid params" do
      before :each do
        put :update, {:id => @video.to_param, :video => FactoryGirl.attributes_for(:updated_video)}
      end

      it "updates the requested video" do
        @video.reload
      end

      it "assigns the requested video as @video" do
        expect(assigns(:video)).to eq(@video)
      end

      it "redirects to the video" do
        expect(response).to redirect_to(@video)
      end
    end

    describe "with invalid params" do
      it "assigns the video as @video" do
        put :update, {:id => @video.to_param, :video => FactoryGirl.attributes_for(:invalid_video)}
        expect(assigns(:video)).to eq(@video)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @video.to_param, :video => FactoryGirl.attributes_for(:invalid_video)}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested video" do
      video = FactoryGirl.create(:video)
      expect {
        delete :destroy, {:id => video.to_param}
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the videos list" do
      video = FactoryGirl.create(:video)
      delete :destroy, {:id => video.to_param}
      expect(response).to redirect_to(videos_url)
    end
  end

end

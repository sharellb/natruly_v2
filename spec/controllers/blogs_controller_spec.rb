require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do

  describe "GET index" do
    it "assigns all blogs as @blogs" do
      blog = FactoryGirl.create(:blog)
      get :index
      expect(assigns(:blogs)).to eq([blog])
    end
  end

  describe "GET show" do
    it "assigns the requested blog as @blog" do
      blog = FactoryGirl.create(:blog)
      get :show, {:id => blog.to_param}
      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe "GET new" do
    it "assigns a new blog as @blog" do
      get :new
      expect(assigns(:blog)).to be_a_new(Blog)
    end
  end

  describe "GET edit" do
    it "assigns the requested blog as @blog" do
      blog = FactoryGirl.create(:blog)
      get :edit, {:id => blog.to_param}
      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Blog" do
        expect {
          post :create, {:blog => FactoryGirl.attributes_for(:blog)}
        }.to change(Blog, :count).by(1)
      end

      it "assigns a newly created blog as @blog" do
        post :create, {:blog => FactoryGirl.attributes_for(:blog)}
        expect(assigns(:blog)).to be_a(Blog)
        expect(assigns(:blog)).to be_persisted
      end

      it "redirects to the created blog" do
        post :create, {:blog => FactoryGirl.attributes_for(:blog)}
        expect(response).to redirect_to(Blog.last)
      end
    end

    describe "with invalid params" do
      it "does not create a new blog" do
        expect {
          post :create, {:blog => FactoryGirl.attributes_for(:invalid_blog)}
        }.to_not change(Blog, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:blog => FactoryGirl.attributes_for(:invalid_blog)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do

    before :each do
      @blog = FactoryGirl.create(:blog) 
    end

    describe "with valid params" do
      before :each do
        put :update, {:id => @blog.to_param, :blog => FactoryGirl.attributes_for(:updated_blog)}
      end

      it "updates the requested blog" do
        @blog.reload
      end

      it "assigns the requested blog as @blog" do
        expect(assigns(:blog)).to eq(@blog)
      end

      it "redirects to the blog" do
        expect(response).to redirect_to(@blog)
      end
    end

    describe "with invalid params" do
      it "assigns the blog as @blog" do
        put :update, {:id => @blog.to_param, :blog => FactoryGirl.attributes_for(:invalid_blog)}
        expect(assigns(:blog)).to eq(@blog)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @blog.to_param, :blog => FactoryGirl.attributes_for(:invalid_blog)}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested blog" do
      blog = FactoryGirl.create(:blog)
      expect {
        delete :destroy, {:id => blog.to_param}
      }.to change(Blog, :count).by(-1)
    end

    it "redirects to the blogs list" do
      blog = FactoryGirl.create(:blog)
      delete :destroy, {:id => blog.to_param}
      expect(response).to redirect_to(blogs_url)
    end
  end

end
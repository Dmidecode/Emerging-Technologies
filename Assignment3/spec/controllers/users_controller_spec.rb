require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "good title" do
      get 'new'
        response.should have_selector("title", :content => "MyLittleWiki | Sign Up")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "Must succeed" do
      get :show, :id => @user
      response.should be_success
    end

    it "must find the good user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "must have the good title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "must include the name of the user" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

      it "must have a profil picture" do
        get :show, :id => @user
        response.should have_selector("h1>img", :class => "gravatar")
      end
  end

end

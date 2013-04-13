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

  describe "POST 'create'" do

    describe "fail" do

      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
                  :password_confirmation => "" }
      end

      it "must not create user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "must have the good title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "MyLittleWiki | Sign Up")
      end

      it "must render 'new'" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
      end

      it "must create a new user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "must redirect to the user page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end    

       it "must log in the user" do
        post :create, :user => @attr
        controller.should be_signed_in
      end

    end

  end

end

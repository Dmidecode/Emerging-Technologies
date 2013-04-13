require 'spec_helper'

describe SessionsController do
	render_views
  
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "must have the good title" do
      get :new
      response.should have_selector("title", :content => "MyLittleWiki | Sign In")
    end
  end

  describe "POST 'create'" do

    describe "invalid signin" do

      before(:each) do
        @attr = { :email => "email@example.com", :password => "invalid" }
      end

      it "must render 'new' page" do
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "must have the good title" do
        post :create, :session => @attr
        response.should have_selector("title", :content => "MyLittleWiki | Sign In")
      end

      it "dmust have a flash.now message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
    end

    describe "with a good email and password" do

      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end

      it "Must sign in the user" do
        post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end

      it "must redirect to the user page" do
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end
    end
  end

  describe "DELETE 'destroy'" do

    it "must deconnect the user" do
      test_sign_in(Factory(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end
  end

end

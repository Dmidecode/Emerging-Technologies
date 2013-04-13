require 'spec_helper'

describe ItemsController do
  render_views

  describe "GET 'new'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end

    it "good title" do
      get 'list'
        response.should have_selector("title", :content => "MyLittleWiki | List")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @item = Factory(:item)
    end

    it "Must succeed" do
      get :show, :id => @item
      response.should be_success
    end

    it "must find the good item" do
      get :show, :id => @item
      assigns(:item).should == @item
    end

    it "must have the good title" do
      get :show, :id => @item
      response.should have_selector("title", :content => @item.productName)
    end

  end

  describe "GET 'new_item'" do
    it "returns http success" do
      get 'addItem'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    describe "fail" do

      before(:each) do
        @attr = { :productName => "", :price => -1, :urlImage => "",
                  :description => "" }
      end

      it "must not construct new item" do
        lambda do
          post :create, :item => @attr
        end.should_not change(Item, :count)
      end

      it "should have the good title" do
        post :create, :item => @attr
        response.should have_selector("title", :content => "New Item")
      end

      it "must render 'new_item' page" do
        post :create, :item => @attr
        response.should render_template('addItem')
      end
    end
    describe "success" do

      before(:each) do
        @attr = { :productName => "Product", :price => 42,
                  :urlImage => "pointToAnImage", :description => "description" }
      end

      it "must create an user" do
        lambda do
          post :create, :item => @attr
        end.should change(Item, :count).by(1)
      end

      it "must redirect to Item add" do
        post :create, :item => @attr
        response.should redirect_to(item_path(assigns(:item)))
      end

      # it "must have a welcome message" do
      #   post :create, :item => @attr
      #   flash[:success].should =~ /Item added !/i
      # end

    end

  end

end

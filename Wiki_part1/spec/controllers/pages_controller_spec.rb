require 'spec_helper'


describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "good title" do
      get 'home'
        response.should have_selector("title", :content => "MyLittleWiki | Home")
    end
  end

  describe "GET 'description'" do
    it "should be successful" do
      get 'description'
      response.should be_success
    end
    it "good title" do
      get 'description'
        response.should have_selector("title", :content => "MyLittleWiki | Description")
    end
  end

  describe "GET 'stream'" do
    it "should be successful" do
      get 'stream'
      response.should be_success
    end

    it "good title" do
      get 'stream'
        response.should have_selector("title", :content => "MyLittleWiki | Stream")
    end
  end

end

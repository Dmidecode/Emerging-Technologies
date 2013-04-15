require 'spec_helper'

describe MicropostsController do
  render_views
  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'store'" do
    it "returns http success" do
      get 'store'
      response.should be_success
    end
  end

end

require 'spec_helper'

describe "LayoutLinks" do
	it "Home at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "Description at '/description'" do
    get '/description'
    response.should have_selector('title', :content => "Description")
  end

  it "Stream at '/stream'" do
    get '/stream'
    response.should have_selector('title', :content => "Stream")
  end

    it "Inscription must be '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Inscription")
  end

end

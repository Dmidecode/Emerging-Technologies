require 'spec_helper'

describe "LayoutLinks" do
	it "Home at '/'" do
    get '/'
    response.should have_selector('title', :content => "MyLittleWiki | Home")
  end

  it "Description at '/description'" do
    get '/description'
    response.should have_selector('title', :content => "MyLittleWiki | Description")
  end

  it "Stream at '/stream'" do
    get '/stream'
    response.should have_selector('title', :content => "MyLittleWiki | Stream")
  end

  it "Konami at '/konami'" do
    get '/konami'
    response.should have_selector('title', :content => "MyLittleWiki | Konami")
  end

  it "Secret at '/secret'" do
    get '/secret'
    response.should have_selector('title', :content => "MyLittleWiki | Secret")
  end

    it "Inscription must be '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "MyLittleWiki | Inscription")
  end

end

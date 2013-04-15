require 'spec_helper'

describe "LayoutLinks" do
	it "Home at '/'" do
    get '/'
    response.should have_selector('title', :content => "MyLittleWiki | All microposts")
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
    response.should have_selector('title', :content => "MyLittleWiki | Sign Up")
  end

describe "when not sign in" do
    it "must have a Sign in link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign In")
    end
  end


end

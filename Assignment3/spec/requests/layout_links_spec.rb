require 'spec_helper'

describe "LayoutLinks" do
	it "Home at '/'" do
    get '/'
    response.should have_selector('title', :content => "MyLittleWiki | List")
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

    it "New_item must be '/new_item'" do
    get '/new_item'
    response.should have_selector('title', :content => "MyLittleWiki | New Item")
  end

    it "Add must be '/add'" do
    get '/add'
    response.should have_selector('title', :content => "MyLittleWiki | New Item")
  end


end

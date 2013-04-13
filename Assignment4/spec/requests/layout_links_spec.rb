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
    response.should have_selector('title', :content => "MyLittleWiki | Sign Up")
  end

describe "when not sign in" do
    it "must have a Sign in link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign In")
    end
  end

  describe "when sign in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in "Password", :with => @user.password
      click_button
    end

    it "must have a link to disconnect" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Disconnect")
    end

    it "must have a link to the profil" 
    visit root_path
    response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
  end

end

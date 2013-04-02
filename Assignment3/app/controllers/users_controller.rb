class UsersController < ApplicationController

  before_filter :setListHeader, :setListFooter

  def setListHeader
    @listHeader = { "Home" => home_path, "Description" => description_path,
                    "Stream" => stream_path, "Konami Code" => konami_path }
  end

  def setListFooter
    @listFooter = { "Sources" => sources_path, "Contact" => contact_path,
                    "Capcom" => 'http://www.capcom.com/', "Hadouken !" => 'http://en.wikipedia.org/wiki/Hadouken_(Street_Fighter)#Hadouken' }
  end

  def new
  	@title = "Sign Up"
    @user = User.new
  end

 def show
    @user = User.find(params[:id])
    @title = @user.name
  end	
end

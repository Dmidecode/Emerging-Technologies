class PagesController < ApplicationController
  before_filter :setListHeader, :setListFooter

  def setListHeader
    @listHeader = { "Home" => home_path, "Description" => description_path,
                    "Stream" => stream_path, "Konami Code" => konami_path }
  end

  def setListFooter
    @listFooter = { "Sources" => sources_path, "Contact" => contact_path,
                    "Capcom" => 'http://www.capcom.com/', "Hadouken !" => 'http://en.wikipedia.org/wiki/Hadouken_(Street_Fighter)#Hadouken' }
  end

  def home
  	@title = "Home"
  end

  def description
  	@title = "Description"
  end

  def stream
  	@title = "Stream"
  end

  def contact
  	@title = "Contact"
  end

  def sources
  	@title = "Sources"
  end

  def konami
    @title = "Konami"
  end

  def secret
    @title = "Secret"
  end

end

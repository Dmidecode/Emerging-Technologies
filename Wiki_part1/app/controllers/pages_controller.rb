class PagesController < ApplicationController
  def home
  	@titre = "Home"
  end

  def description
  	@titre = "Description"
  end

  def stream
  	@titre = "Stream"
  end

  def contact
  	@title=  "Contact"
  end

  def sources
  	@title = "Sources"
  end
end

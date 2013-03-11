class PagesController < ApplicationController
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

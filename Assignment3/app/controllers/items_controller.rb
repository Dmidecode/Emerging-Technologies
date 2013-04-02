class ItemsController < ApplicationController
  before_filter :setListHeader, :setListFooter

  def setListHeader
    @listHeader = { "Home" => home_path, "Description" => description_path,
                    "Stream" => stream_path, "Konami Code" => konami_path }
  end

  def setListFooter
    @listFooter = { "Sources" => sources_path, "Contact" => contact_path,
                    "Capcom" => 'http://www.capcom.com/', "Hadouken !" => 'http://en.wikipedia.org/wiki/Hadouken_(Street_Fighter)#Hadouken' }
  end

  def list
  	@title = "List"
    @allItem = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @title = @item.productName
  end

  def addItem
  	@item = Item.new
  	@title = "New Item"
  end

  def create
    @item = Item.new(params[:item])
    if @item.save

      # If we want to warn the user
      # flash[:success] = "Item added !"

      redirect_to @item
    else
      @title = "New Item"
      render :action =>'addItem'
    end
  end
end

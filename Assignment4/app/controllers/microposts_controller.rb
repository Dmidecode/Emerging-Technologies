class MicropostsController < ApplicationController

  def new
  	@title = "Add a micropost"
  	@micro = Micropost.new
  end

  def show
  	@title = "All microposts"
  	@micro = Micropost.all
  end

  def store
  	@title = "Lists of store microposts"
    @micro = Micropost.all
  end

  def create
  	@micro = Micropost.new(params[:micropost])
  	if @micro.save
  		flash[:success] = "Post Added !"
  		redirect_to root_path
  	else
  		@title = "Add a micropost"
  		render 'new'
  	end
  end


end

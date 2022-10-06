class EntriesController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.all
    #@comments = Comment.all
    @likes = Like.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @entry = Entry.new

    respond_to do |format|
      format.html
      format.js

    end
  end

  def edit
    @entry = Entry.find(params[:id])
    respond_to do |format|
    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    format.js  
    redirect_to entry_path(@entry)
  end 
  end

 
  def create
    #debugger
    #@entry = Entry.create(entry_params)
    @entry = Entry.new
    @entry.name = params[:entry][:name]
    @entry.address = params[:entry][:address]
    @entry.email = params[:entry][:email]
    @entry.phone = params[:entry][:phone]
    @entry.image = params[:entry][:image]
    @entry.save
    
    respond_to do |format|
      format.js
      #redirect_to root_path
    end
end

  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry) }
        format.js
        redirect_to root_path
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
  @entry = Entry.find(params[:id])
  @entry.destroy
  respond_to do |format|
    #format.html { redirect_to entries_url, notice: 'User was successfully destroyed.' }
    format.js  
  end
  #redirect_to root_path
end

private
  def entry_params

      params.require(:entry).permit(:name, :email, :address, :phone, :image)
  end
end

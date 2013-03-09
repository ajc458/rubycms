class PagesController < ApplicationController
  
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @pages = Page.order('pages.position ASC')
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def create
    # instantiate a new object using form parameters
    @page = Page.new(params[:page])
    # save object
    if @page.save
      # if success, redirect to list action
      flash[:notice] = 'Page created.'
      redirect_to(:action => 'list')
    else
      # if fails, redisplay form
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    # find object using form parameters
    @page = Page.find(params[:id])
    # update the object
    if @page.update_attributes(params[:page])
      # if success, redirect to list action
      flash[:notice] = 'Page updated.'
      redirect_to(:action => 'show', :id => @page.id)
    else
      # if fails, redisplay form
      render('edit')
    end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    # destroy object
    Page.find(params[:id]).destroy
    # redirect
    flash[:notice] = 'Page destroyed.'
    redirect_to(:action => 'list')
  end
  
end

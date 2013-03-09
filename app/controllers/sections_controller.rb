class SectionsController < ApplicationController
  
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @sections = Section.order('sections.position ASC')
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new
  end
  
  def create
    # instantiate a new object using form parameters
    @section = Section.new(params[:section])
    # save object
    if @section.save
      # if success, redirect to list action
      flash[:notice] = 'Section created.'
      redirect_to(:action => 'list')
    else
      # if fails, redisplay form
      render('new')
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    # find object using form parameters
    @section = Section.find(params[:id])
    # update the object
    if @section.update_attributes(params[:section])
      # if success, redirect to list action
      flash[:notice] = 'Section updated.'
      redirect_to(:action => 'show', :id => @section.id)
    else
      # if fails, redisplay form
      render('edit')
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    # destroy object
    Section.find(params[:id]).destroy
    # redirect
    flash[:notice] = 'Section destroyed.'
    redirect_to(:action => 'list')
  end
  
end

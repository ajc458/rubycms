class SubjectsController < ApplicationController
  
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @subjects = Subject.order('subjects.position ASC')
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end
  
  def create
    # instantiate a new object using form parameters
    @subject = Subject.new(params[:subject])
    # save object
    if @subject.save
      # if success, redirect to list action
      flash[:notice] = 'Subject created.'
      redirect_to(:action => 'list')
    else
      # if fails, redisplay form
      @subject_count = Subject.count + 1
      render('new')
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  
  def update
    # find object using form parameters
    @subject = Subject.find(params[:id])
    # update the object
    if @subject.update_attributes(params[:subject])
      # if success, redirect to list action
      flash[:notice] = 'Subject updated.'
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # if fails, redisplay form
      @subject_count = Subject.count
      render('edit')
    end
  end
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    # destroy object
    Subject.find(params[:id]).destroy
    # redirect
    flash[:notice] = 'Subject destroyed.'
    redirect_to(:action => 'list')
  end
  
end

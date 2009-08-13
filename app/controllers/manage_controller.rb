class ManageController < ApplicationController
  
  def index
    @categories = Category.all    
  end
  
  def modify
    if params[:course_number]
      if Course.find_by_course_number(params[:course_number])
        @course = Course.find_by_course_number(params[:course_number])
      else
        flash[:notice] = "The Course CSCI #{params[:course_number]} does not exist"
        @course = Course.find_by_course_number(1170)
      end
    else # prevents crash if no course_number specified [defaults to 1170]
      @course = Course.find_by_course_number(1170)
    end

    respond_to do |format|
      format.html # view_repo.html.erb
      format.xml  { render :xml => @course }
    end
  end
  
  def generate_course_page
  end
  
end

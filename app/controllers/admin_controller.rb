class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash.now[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to(:action => "login")
  end

  def index
  end
  
  def view_repo
    
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

end

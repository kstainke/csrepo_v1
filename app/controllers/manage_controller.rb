class ManageController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def generate_course_page
  end
  
end

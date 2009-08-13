class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = "Category #{@category.category} was successfully created."
        format.html { redirect_to(@category) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @course_number = Course.find_by_course_number(params[:course_number])
    @category = Category.new
    @category.course_id = @course_number

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    category = Category.find(params[:id])
    category.category = params[:value]
    category.save
    category.reload
    render_text category.category
  end
  
  
  def destroy
    @category = Category.find(params[:id])
    #################################
    ## Future code for lab deletion
    #################################
    #assignments = Assignment.find(:all, :order => "created_at DESC")
    #for item in assignments do
    #  if(item.course_id == @course.id)
    #    item.destroy
    #  end
    #end
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(manage_url) }
      format.xml  { head :ok }
    end
  end
  
end

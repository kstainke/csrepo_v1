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
  
protected

  def alpha_name_add(course_number)
    @categories_by_course_sorted = category_by_course_alph_sorted(course_number)
    
    alpha_hash={ 1=>"A", 2=>"B", 3=>"C", 4=>"D", 5=>"E", 6=>"F", 7=>"G", 8=>"H",
      9=>"I", 10=>"J", 11=>"K", 12=>"L", 13=>"M", 14=>"N", 15=>"O", 16=>"P",
      17=>"Q", 18=>"R", 19=>"S", 20=>"T", 21=>"U", 22=>"V", 23=>"W", 24=>"X",
      25=>"Y", 26=>"Z" }
      i=1
      for item in @categories_by_course_sorted do
        print i
        print alpha_hash[i]
        while i < 26 do
          if(item.letter==alpha_hash[i]) then i+=1; break
          else(return alpha_hash[i]; break)
          end
        end
      end
      return alpha_hash[i]
  end

end

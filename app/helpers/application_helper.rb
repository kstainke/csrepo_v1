# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def category_by_course(course_number)
    categories = Category.find(:all)
    @courses_categories = Array.new
    for item in categories do
      if(item.course_id == course_number)
        @courses_categories << item
      end
    end
    return @courses_categories
  end
end

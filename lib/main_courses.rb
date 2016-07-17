class MainCourse
  attr_accessor :main_course_list

  def initialize
    @main_course_list = []
  end

  def list
    CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/main_courses.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @main_course_list << {dish => price} }
  end
end

end

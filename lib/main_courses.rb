class MainCourse
  attr_reader :main_course

  def initialize
    @main_course = []
    self.list
  end

  def list
    CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/main_courses.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @main_course << {dish => price}}
  end
end

end

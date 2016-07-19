require 'csv'

class MainCourse
  attr_reader :main_course, :list

  def initialize
    @main_course = {}
    self.list
  end

  def list
    CSV.open(File.dirname(__FILE__)+'/main_courses.csv', :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @main_course.merge!(dish => price.to_f)}
  end
end

end

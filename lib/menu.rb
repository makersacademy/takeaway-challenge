require 'csv'


class Menu

attr_accessor :starters
attr_accessor :main_course


  def initialize
    CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/starters.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @starters = {dish.to_sym => price} }
    end

    CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/main_courses.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @main_course = {dish.to_sym => price} }
  end

end
end

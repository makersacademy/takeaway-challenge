require 'csv'


class Menu

attr_accessor :starters


  def initialize
    CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/dishes.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
    dishes.each { |dish, price| @starters = {dish.to_sym => price} }
  end

  end
end

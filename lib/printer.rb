class Printer

  def format(something_to_print)
    something_to_print.each{|hash|
    puts "#{hash[:Dish]}: £#{hash[:Price]}"}

  end

end

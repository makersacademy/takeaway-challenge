require_relative "order"

class Printer

  # def initialize #(total = Order.new)
  #   @total = 0
  # end


  def format(something_to_print)
    something_to_print.each{|hash|
    puts "#{hash[:Dish]}: £#{hash[:Price]}"}
  end

  def print_bill(complete_order)
    complete_order.each{ |hash|
    puts "#{hash[:Dish]}: £#{hash[:Price]}"}
    puts "Total: " + "£" + Order.new.total.to_s #doubt if will work


  end

end

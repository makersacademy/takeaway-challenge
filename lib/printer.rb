require_relative 'menu'

class Printer

  def initialize
  end

  def printmenu(menu = Menu.new)
    menu.dishes.each_pair do |k, v|
      puts "#{k}. #{v[:dish]} - £#{v[:price]}."
    end
  end

  def printorder(current_order = $current_order)
    puts "-----YOUR ORDER-----"
    current_order.ordered_dishes.each do |dish|
      puts "#{dish[:dish]} - £#{dish[:price]}."
    end
    puts "--------------------"
  end

  def printsummary(current_order = $current_order)
    print "The number of dishes ordered is #{current_order.ordered_dishes.count}. Your total is £#{current_order.ordertotal(current_order.ordered_dishes)}."
  end

end

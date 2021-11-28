require_relative('./order.rb')
class Takeaway
  attr_reader :menu, :total, :order

    def initialize(order = Order.new)
      @menu = {
        "Eggs Benedict" => 8.50, 
         "Full English" => 9, 
         "Waffles" => 6
        }
      @total = 0
      @order = order
    end 

    def print_menu
      @menu.each do |item, price|
      puts "#{item}: £#{price}" 
      end 
    end

    def add_to_order(dish)
       @order.basket << @menu.assoc(dish)
    end 

    def show_total
      @order.basket.each do |item, price| 
      @total += price
      end 
      puts total
    end
end 
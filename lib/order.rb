class Order
  attr_reader :order

  def initialize (order_line_class)
    @order_line = order_line_class
    @order = []
  end

  def create(dish_list)
    do until selection == 99
      puts "Enter menu item number (or 99 to complete order)"
      selection = gets.chomp
      if selection == 99 || not an integer
        return @order
      elsif dish_list[selection - 1].name == ""
        puts "invalid selection"
      else
        puts dish_list[selection - 1].name
        puts "enter quantity"
        quantity = gets.chomp
        if quantity > 0
          self.add_order_line(quantity, selection, dish_list)
        end
      end
    end
  end

  def add_order_line(quantity, selection, dish_list)
    @order << @order_line.new(quantity, dish_list[selection - 1].name, dish_list[selection - 1].price)
  end
end

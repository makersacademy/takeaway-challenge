require_relative "takeaway"

class Order
  attr_reader :order_list, :menu, :order_total

  def initialize
    @order_list = []
    @order_total = 0
    @menu = Takeaway.new.menu_list
  end

  def make_order
    loop do
      puts "Here is the menu: #{@menu}"
      puts "What would you like to order? "
      selection = gets.chomp
        if selection.empty?
          order_summary
          break
        else 
          add_item(selection)
        end  
    end
  end

  def add_item(item)
    @menu.each do |k, v|
      if item == k
        @order_list << k
        @order_total += v
        order_summary
      end
    end
  end

  def order_summary
    puts "Here is your order: #{@order_list}"
    puts "Here is your total: £#{@order_total}" 
  end

  def verify
    dish_sum = 0
    @menu.each do |k, v|
      @order_list.each do |dish|
        if k == dish
          dish_sum += v
        end
      end
    end
    
    if dish_sum == @order_total
      return "Your order total matches the sum of dishes"
    else
      return "Your order total does not match the sum of dishes"
    end
  end
end

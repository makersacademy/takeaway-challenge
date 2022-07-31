require_relative 'menu'
class Takeaway
  attr_reader :menu, :orders

  def initialize
    @menu = Menu.new
    @orders = []
    @sum = 0
  end

  def add_orders(choice)
    @orders.push(choice)  
  end

  def print_menu
    @menu.print_dishes
  end

  def print_orders
    @menu.dishes.each do |key, value|
      @orders.each do |choice|
        if choice.to_sym == key 
          return "You ordered #{key}: £#{value}"
        end
      end
    end
  end

  def orders_total
    @orders.each { |choice| @sum += @menu.dishes[choice.to_sym].to_i }
    return "£#{@sum}"
  end 
end

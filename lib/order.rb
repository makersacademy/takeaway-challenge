require_relative 'menu'

class Order
  attr_reader :total_order
  ERROR_IN_COST = "Sorry, the cost is wrong"
  THANK_YOU = "Thanks for your order!"

  def initialize
    @total_order = []
    @my_menu = Menu.new
    @cost = 0
  end

  def read_menu
    @my_menu.show_menu
  end

  def add_item(item, amount = 1)
    item_ordered = {}
    item_ordered[item] = amount
    @total_order << item_ordered
    puts "#{amount}x #{item}(s) added to your basket"
  end

  def basket_summary
    basket_summary = []
    @total_order.each do |order_hash|
      order_hash.each do |item, quantity|
        basket_summary << "#{item} x#{quantity} = £#{@my_menu.menu[item] * quantity}"
      end
    end
    puts basket_summary.join(", ")
  end

  def show_cost
    @cost = calculate_cost
    puts "Total: £#{@cost}"
  end

  def calculate_cost
    @total_order.each do |order_hash|
      order_hash.each do |item, quantity|
        @cost += (@my_menu.menu[item] * quantity)
      end
    end
    @cost
  end

  def check_out(expected_cost)
    @cost = calculate_cost
    raise ERROR_IN_COST if @cost != expected_cost
    print THANK_YOU
  end

end

require './lib/order.rb'
require './lib/messenger.rb'

class Shop
  attr_reader :menu, :current_order, :menu_string
  def initialize
    @menu = {
      :burger => 9,
      :fish => 8,
      :pizza => 8,
      :tacos => 7,
      :chips => 3,
      :cola => 1,
      :lemonade => 1
    }
  end

  def show_menu
    @menu_string = "you can choose from...\n"
    menu.each { |item, price| @menu_string << "#{item} - £#{price} \n" }
    puts @menu_string
  end

  def start_order
    @current_order = Order.new
  end

  def add_to_order(order, item, quantity = 1)
    fail "sorry we don't sell #{item}" unless @menu.key?(item.to_sym)
    item_price = @menu[item.to_sym]
    order.add(item, item_price, quantity)
  end

end

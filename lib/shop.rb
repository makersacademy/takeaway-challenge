require_relative 'order'

class Shop
  attr_reader :menu, :current_order
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
    menu_string = "you can choose from...\n"
    menu.each { |item, price| menu_string << "#{item} - £#{price} \n" }
    puts menu_string
  end

  def start_order
    @current_order = Order.new
  end

  def add_to_order(order, item, quantity = 1)
    order.add(item, quantity)
  end

end

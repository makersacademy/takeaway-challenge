require_relative 'menu'
require_relative 'text'

class Customer

  attr_reader :order, :cost, :text, :menu

  def initialize(menu = Menu.new, text = Text.new)
    @order = []
    @cost = 0
    @menu = menu
    @text = text
  end

  def add_dish(dish)
    menu.dishes.each do |item, price|
      if dish == item
        @order << { dish => price }
        @cost += price
      else "Sorry that item is not on the menu"
      end
    end
  end

  def display_order
    order.each do |item, _price|
      puts "#{item.keys.join} - £#{'%.2f' % item.values.join}"
    end
    puts "Total cost: £#{'%.2f' % @cost}\nYou have ordered #{order.length} items"
  end

  def complete_order
    text.send_text
  end

  def display_menu
    menu.print_menu
  end

end

require_relative 'menu'
require_relative 'text'

class Customer

  attr_reader :order, :menu, :cost, :text

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @order = []
    @text = text
    @cost = 0
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
      @order.each do |item, price|
        puts "#{item.keys.join} - £#{'%.2f' % item.values.join}"
      end
      puts "Total cost: £#{'%.2f' % @cost}"
      puts "You have ordered #{order.length} items"
    end

  def complete_order
    text.send_text
  end

end

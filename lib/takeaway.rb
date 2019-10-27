require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
    @total = 0
  end

  def show_menu
    @menu.display_menu
  end

  def add_to_order(item, quantity)
    item = item.downcase
    raise "Item not on menu!" if on_menu?(item.to_sym) == false
    raise "Quantity not entered!" if quantity < 1

    @basket.set_basket(item.to_sym, quantity)
  end

  def show_order
    @basket.basket.each { |dish, qty|
      unit_price = @menu.menu[dish]
      puts "Order Basket:"
      puts "#{qty}x #{dish} = £#{unit_price * qty}"
      @total += (unit_price * qty)
    }
    puts "Total: £#{@total}"
  end

  private 

  def on_menu?(item)
    @menu.menu.has_key?(item)
  end
end

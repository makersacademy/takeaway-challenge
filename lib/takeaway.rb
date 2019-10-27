require_relative 'menu'
require_relative 'basket'
require_relative 'notification'

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
    puts "Order Basket:"
    @basket.basket.each { |dish, qty|
      unit_price = @menu.menu[dish]
      puts "#{qty}x #{dish} = £#{unit_price * qty}"
      @total += (unit_price * qty)
    }
    puts "Total: £#{@total}"
  end

  def confirm(price, notification = Notification.new)
    @notification = notification
    @basket.basket.each { |dish, qty|
      unit_price = @menu.menu[dish]
      @total += (unit_price * qty)
    }

    if price == @total
      @notification.send_sms
    else
      puts "Wrong total. Please try again."
    end
  end

  private 

  def on_menu?(item)
    @menu.menu.has_key?(item)
  end
end

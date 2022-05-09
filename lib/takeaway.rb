class Takeaway

  def initialize(menu = Menu.new, checkout = Checkout.new)
    @menu = menu
    @checkout = checkout
    @total = 0
  end

  def show_menu
    @menu.display_menu
  end

  def add_to_order(item, quantity)
    item = item.downcase
    raise "Item isn't on the menu" if on_menu?(item.to_sym) == false

    @checkout.set_checkout(item.to_sym, quantity)
  end

  def show_order
    puts "Order:"
    @checkout.checkout.each { |dish, qty|
      unit_price = @menu.menu[dish]
      puts "#{qty}x #{dish} = £#{unit_price * qty}"
      @total += (unit_price * qty)
    }
    puts "Total: £#{@total}"
    @total = 0
  end

  private

  def on_menu?(item)
    @menu.menu.has_key?(item)
  end
end

class Checkout
  attr_reader :checkout

  def initialize
    @checkout = {}
  end

  def set_checkout(item, quantity)
    if @checkout.include?(item)
      @checkout[item] += quantity
    else
      @checkout[item] = quantity
    end
    "#{quantity}x #{item} added to checkout."
  end

end

class Menu
  attr_reader :menu

  def initialize
    @menu = {
      carbonara: 9.99,
      turkey: 11,
      orange: 3,
      burrito: 3.99
      }
  end

  def display_menu
    puts "Menu Options:"
    @menu.each { |dish, price|
      puts "#{dish.capitalize}: £#{price}"
    }
  end

end

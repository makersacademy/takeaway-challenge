require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def add(item, quantity = 1)
    raise "This dish is not on the menu" if not_on_menu(item)
    update_basket(item, quantity) if order_includes?(item)
    @basket[item] = quantity unless order_includes?(item)
  end

  def summary
    puts "Order Summary"
    @basket.each do |dish, quantity|
      puts "#{dish} x#{quantity} £#{sprintf('%.2f', @menu.dishes[dish] * quantity)}"
    end
  end

  # this method does not work yet
  def total
    counter = 0
    total = 0
    while counter < @basket.length
      total += sprintf('%.2f', @menu.dishes[dish] * quantity)
      counter += 1
    end
    puts "Order total is £#{total}"
  end

  private

  def order_includes?(item)
    @basket.each_key do |dish|
      return true if dish == item
    end
    false
  end

  def not_on_menu(item)
    !@menu.includes?(item)
  end

  def update_basket(item, quantity)
    quantity = @basket[item] + quantity
    @basket[item] = quantity
  end

end

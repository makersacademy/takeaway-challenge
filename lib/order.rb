require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @total = 0
  end

  def add(item, quantity = 1)
    raise "This dish is not on the menu" if not_on_menu(item)
    update_basket(item, quantity) if order_includes?(item)
    @basket[item] = quantity unless order_includes?(item)
    "#{quantity}x #{item} has been added to your order"
  end

  def summary
    puts "Order Summary"
    @basket.each do |dish, quantity|
      puts "#{dish} x#{quantity} £#{sprintf('%.2f', @menu.dishes[dish] * quantity)}"
    end
    puts total
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

  def total
    @basket.each do |dish, quantity|
      @total += @menu.dishes[dish] * quantity
    end
    "Order total is £#{sprintf('%.2f', @total)}\n"
  end

end

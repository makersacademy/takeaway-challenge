require_relative 'menu'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @total = 0
  end

  def add(item, quantity = 1)
    raise "This dish is not on the menu" unless on_menu?(item)
    update_basket(item, quantity)
    "#{quantity}x #{item} has been added to your order"
  end

  def summary
    puts "Order Summary"
    display_line_items
    puts "Order total is £#{total}"
  end

  private

  def on_menu?(item)
    @menu.dishes.each_key { |dish| return true if item == dish }
  end

  def in_basket?(item)
    basket.each_key { |dish| return true if item == dish }
    false
  end

  def update_basket(item, quantity)
    quantity += basket[item] if in_basket?(item)
    basket[item] = quantity
  end

  def total
    basket.each do |dish, quantity|
      @total += @menu.dishes[dish] * quantity
    end
    sprintf('%.2f', @total)
  end

  def display_line_items
    basket.each do |dish, quantity|
      subtotal = sprintf('%.2f', @menu.dishes[dish] * quantity)
      puts "#{dish} x#{quantity} £#{subtotal}"
    end
  end

end

require_relative 'menu' 
class Order
  attr_reader :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end 

  def select(item, quantity = 1)
    fail "#{item.to_s.capitalize} is not on the menu." unless in_menu?(item)

    @basket[item] = quantity
  end

  def total
    total_price_per_item.inject { |sum, item| sum + item }
  end 

  def checkout_view
    puts "This is your order summary:"
    @basket.each do |item, quantity|
      puts "#{quantity} x #{item}: Unit price: £#{"%0.2f" % @menu[item]}, Total: £#{"%0.2f" % (@menu[item] * quantity)}."
    end
    puts "Order total: £#{total}"
  end

  private

  attr_reader :menu

  def in_menu?(item)
    @menu.include?(item)
  end

  def total_price_per_item
    @basket.map do |dish, quantity|
    @menu[dish] * quantity
    end 
  end
end

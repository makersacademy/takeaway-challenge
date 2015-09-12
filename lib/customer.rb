require_relative 'menu.rb'

class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu.dishes
  end

  def display_menu
   menu.each { |key, value| "#{key}, £#{value}" }
  end

  def place_order(dish, quantity)
    fail "This dish is not on the menu" unless menu.has_key?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
  end

  def receipt
    order.map do |dish, quantity|
      puts "Dish: #{dish} x#{quantity}"
    end
  end


  def total
    order.map {|dish, quantity| self.menu[dish] * quantity}.reduce(:+)
  end

end

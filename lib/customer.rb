require_relative 'menu.rb'

class Customer

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @menu = menu.dishes
    @order = {}
    @total = 0
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
    @total += @menu[dish]
  end

  def receipt
    order.map do |dish, quantity|
      "Dish: #{dish} x#{quantity}"
    end.join(", ")
  end

  def total_cost
    order.map {|dish, quantity| self.menu[dish] * quantity}.reduce(:+)
  end

  def charge total_cost
    raise "Payment does not match total" if (total_cost != @total)
  end


end

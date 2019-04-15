require_relative 'menu'

class Order
  attr_reader :selected

  def initialize(menu = Menu.new.dishes)
    @selected = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    @selected[dish.to_sym] += quantity
  end

  def total
    total = 0
    @selected.each do |dish, quantity|
      total += quantity * @menu[dish]
    end
    "Your order total is £#{total}"
  end
end

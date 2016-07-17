require_relative 'menu'

class Order

  attr_reader :basket, :current_total

  def initialize
    @menu = Menu.new.dish_list
    @basket = Hash.new(0)
    @current_total = 0
  end

  def add_to_order(food,quantity=1)
    fail 'No such dish on menu' unless on_menu?(food)
    basket[food] += quantity
    calculate_total(food,quantity)
  end

  private

  def calculate_total(food,quantity)
    total = @menu[food] * quantity
    @current_total += total.round(2)
  end

  def on_menu?(food)
    @menu.include?(food)
  end
end

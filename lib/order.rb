require 'pry'
require_relative 'dish'

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def select_dish(dish, quantity)
    fail "The dish is not in the menu" unless has_dish?(dish)
    dish.quantity = quantity
    @selected_dishes << dish
    dish
  end

  def total
    @selected_dishes.map do |dish| 
      dish.quantity * dish.args[:price]
    end.inject(:+)
  end

  private

    def has_dish?(dish)
      @menu.dishes.include?(dish)
    end
end
require_relative 'list_of_dishes'

class Order
  attr_reader :summary

  def initialize(list_of_dishes, selections)
    raise ArgumentError, 'order must not be empty' if selections.empty?
    populate_summary(list_of_dishes, selections)
  end

  private

  def populate_summary(list_of_dishes, selections)
    @summary = {}
    selections.each do |dish, quantity|
      full_dish = list_of_dishes.get_dish(dish)
      @summary[dish] = { quantity: quantity, price: full_dish.price }
    end
  end
end
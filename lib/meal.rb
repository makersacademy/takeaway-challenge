require_relative 'restaurant'

class Meal

  def initialize(order)
    @order = order
    @prices = []
    @selected_dishes = []
    @total_price = 0
  end

  attr_reader :selected_dishes

  def select_dishes(restaurant, *dishes)
    raise "No Dishes Selected" if dishes.compact.empty?

    dish_list = dishes.flatten.map{|dish| dish.to_s}

    @selected_dishes = restaurant.dishes.select do |item|
      dish_list.include?(item.name)
    end
  end

  def view_prices
    raise "No Dishes Selected" if @selected_dishes.empty?
    @selected_dishes.each do |item|
      @prices << item.price
    end
    @prices
  end

  def total_price
    view_prices
    @prices.each {|price| @total_price += price}
    @total_price
  end

end

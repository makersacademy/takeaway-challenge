require_relative 'restaurant'

class Meal

  def initialize()
    @prices = []
    @selected_dishes = []
  end

  attr_reader :selected_dishes

  def select_dishes(restaurant, *dishes)
    raise "No Dishes Selected" if dishes.compact.empty?

    dish_list = dishes.flatten.map{|dish| dish.to_s}

    @selected_dishes = restaurant.display.select do |item|
      dish_list.include?(item.name)
    end
  end

  def view_prices
    raise "No Dishes Selected" if @selected_dishes.empty?
    @prices = []
    @selected_dishes.each do |item|
      @prices << item.price
    end
    @prices
  end

  def total_price
    view_prices
    @prices.reduce {|sum, item| sum + item}
  end

  def delete_meal
    @selected_dishes = []
  end
end

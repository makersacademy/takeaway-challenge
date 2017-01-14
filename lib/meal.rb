require_relative 'restaurant'

class Meal

  attr_reader :selected_dishes

  def select_dishes(restaurant, *dishes)
    return nil if dishes.compact.empty?

    dish_list = dishes.flatten.map{|dish| dish.to_s}

    @selected_dishes = restaurant.dishes.select do |item|
      dish_list.include?(item.name)
    end
  end
end

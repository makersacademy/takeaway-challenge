
class List
  DEFAULT_DISHES = {
                    :burrata => 6, :lasagna => 11,
                    :risotto => 10, :parmigiana => 12.50,
                    :quinoa_salad => 7.50
                    }
  attr_accessor :available, :food_order

  def initialize
    @available = Hash.new
    @food_order = Hash.new { |hash, key| hash[key] = 0 }
  end

  def load_predefined_dishes
    @available = DEFAULT_DISHES
  end

  def add_dishes *dishes
    dishes.each_with_index { |name, index| available[dishes[index].name] = dishes[index].price }
  end

  def select_food_order *dish_names
    fail 'Your food selection is not available.' unless food_available? dish_names
    dish_names.each { |name| food_order[name] += 1 }
  end

  def food_available? selected_food
    selected_food.any? { |name| available.has_key?(name) }
  end

  def food_order_sum
    sum = 0
    food_order.each_key { |dish| sum += (available[dish] * food_order[dish]) }
    sum
  end
end




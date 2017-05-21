require 'menu'

class Order

  attr_reader :menu, :meal

  def initialize(menu)
    @menu = menu
    @meal = []
  end

  def select_dish(selection)
    selection.respond_to?(:even?) ? select_dish_by_number(selection) : select_dish_by_name(selection)
  end

  def view_meal
    @meal.uniq.each_with_index{|dish, index| puts "Item: #{index + 1}, #{dish.name}, £#{dish.price}, X#{@meal.count(dish)}."}
    puts "TOTAL: £#{calculate_total_price}"
  end

  def remove_dish(selection)
    selection.respond_to?(:even?) ? remove_dish_by_number(selection) : remove_dish_by_name(selection)
  end

private

  def remove_dish_by_number(selection)
    fail error_unrecognised_dish_message if can_not_find_number_in_meal?(selection)
    @meal.delete_at(selection - 1 )
  end

  def remove_dish_by_name(selection)
    fail error_unrecognised_dish_message unless can_find_name_in_meal?(selection)
    @meal.delete_at(@meal.index(@meal.find { |dish| dish.name.downcase == selection.downcase }))
  end

  def select_dish_by_number(selection)
    fail error_unrecognised_dish_message if can_not_find_number_in_menu?(selection)
    @meal << @menu.dishes[selection - 1]
  end

  def select_dish_by_name(selection)
    fail error_unrecognised_dish_message unless can_find_name_in_menu?(selection)
    @menu.dishes.each do
      |dish| @meal << dish if dish.name.downcase == selection.downcase
    end
  end

  def can_find_name_in_menu?(selection)
    @menu.dishes.any? { |dish| dish.name.downcase == selection.downcase}
  end

  def can_find_name_in_meal?(selection)
    @meal.any? { |dish| dish.name.downcase == selection.downcase}
  end

  def can_not_find_number_in_menu?(selection)
    @menu.dishes[selection -1].nil?
  end

  def can_not_find_number_in_meal?(selection)
    @meal[selection -1].nil?
  end

  def error_unrecognised_dish_message
    "Sorry, I don't recognise that dish, please try again"
  end

  def calculate_total_price
    prices = []
    @meal.each{ |dish| prices << dish.price }
    prices.inject{ |sum, price| sum + price }
  end
end

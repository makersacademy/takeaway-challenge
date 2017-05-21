require 'menu'
require 'confirmation_text'

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

  def confirm_order
    confirmation_message
    Confirmation_text.new(calculate_total_price)
  end

private

  def remove_dish_by_number(selection)
    fail error_unrecognised_dish_message if can_not_find_number?(@meal, selection)
    @meal.delete_at(selection - 1 )
  end

  def remove_dish_by_name(selection)
    fail error_unrecognised_dish_message unless can_find_name?(@meal, selection)
    @meal.delete_at(@meal.index(@meal.find { |dish| dish.name.downcase == selection.downcase }))
  end

  def select_dish_by_number(selection)
    fail error_unrecognised_dish_message if can_not_find_number?(@menu.dishes, selection)
    @meal << @menu.dishes[selection - 1]
  end

  def select_dish_by_name(selection)
    fail error_unrecognised_dish_message unless can_find_name?(@menu.dishes, selection)
    @menu.dishes.each { |dish| @meal << dish if dish.name.downcase == selection.downcase }
  end

  def can_find_name?(target, selection)
    target.any? { |dish| dish.name.downcase == selection.downcase}
  end

  def can_not_find_number?(target, selection)
    target[selection -1].nil?
  end

  def error_unrecognised_dish_message
    "Sorry, I don't recognise that dish, please try again"
  end

  def confirmation_message
    puts "Thanks! Your order:\n-------------------\n"
    view_meal
    puts "-------------------\nHas been placed!"
  end

  def calculate_total_price
    prices = []
    @meal.each{ |dish| prices << dish.price }
    prices.inject{ |sum, price| sum + price }
  end
end

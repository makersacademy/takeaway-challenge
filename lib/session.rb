require_relative './meal.rb'
require_relative './dishes.rb'
require_relative './sms.rb'
require_relative './copy.rb'

class Session
include Copy

  @@order_number = 0

  def initialize(meal = Meal.new, dishes = Dishes.new, text = Sms.new)
    @meal = meal
    @dishes = dishes
    @text = text
    welcome
    menu
  end

  private

  def menu
    options
    menu_selector
  end

  def menu_selector
    case gets.chomp
    when "1"
      dish_add
    when "7"
      dish_remove
    when "8"
      list_dishes
    when "9"
      confirmation
    when "0"
      close
    else
      apology
      menu
    end
  end

  def dish_add
    show_all_dishes
    add_dish_prompt
    selection = gets.chomp
    invalid_dish?(selection) ? apology : @meal.add_dish(@dishes.list[selection.to_i - 1])
    menu
  end

  def invalid_dish?(selection)
    return true unless selection =~ /^[0-9]+$/
    return true if selection.to_i > @dishes.list.length
  end

  def show_all_dishes
    dishes_header
    @dishes.list.each_with_index { |dish, index| puts "\t#{index+1}. #{dish.name} (£#{'%.2f' % dish.price})" }
  end

  def dish_remove
    basket_empty?
    meal_summary
    select_a_dish_to_remove
    @meal.remove_dish(@meal.items[gets.chomp.to_i - 1])
    menu
  end

  def confirmation
    basket_empty?
    meal_summary
    ask_for_phone_number
    phone_number = gets.chomp
    y_confirmation(phone_number)
    gets.chomp =~ /^[Yy]/ ? submit_order(phone_number) : menu
    nil
  end

  def submit_order(phone)
    @@order_number += 1
    @text.send_confirmation_message(phone, @@order_number, @meal.total_cost)
    confirmed_order
    @meal.clear_meal
    welcome
    menu
  end

  def list_dishes
    basket_empty?
    meal_summary
    menu
  end

  def basket_empty?
    return false unless @meal.items.empty?
    empty_basket_warning
    menu
  end

  def meal_summary
    order_summary_header
    @meal.items.each_with_index { |dish, index| puts "\t#{index+1}. #{dish.name} (£#{'%.2f' % dish.price})" }
    order_summary_total
    print @meal.total_cost + "\n"
  end

  def close
    exit
  end

end

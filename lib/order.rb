require 'menu.rb'
require 'SMS.rb'

# this shows the list of dishes which can be added to an order
class Order
  attr_reader :menu, :current_order, :final_cost

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = {}
  end

  def view_menu
    menu.list
  end

  def print_menu
    menu.list.each do |_key, dish|
      puts "#{dish.name} £#{dish.price}"
    end
    return
  end

  def add(dish, quantity = 1)
    key = format_key(dish)
    add_guards(key, dish, quantity)
    add_to_current_order(key, dish, quantity)
  end

  def delete(dish)
    key = format_key(dish)
    delete_guards(key)
    delete_from_current_order(key)
  end

  def total_cost
    @final_cost = 0
    @current_order.each do |dish|
      dish[1].quantity.to_i.times do
        @final_cost += dish[1].price
      end
    end
    @final_cost
  end

  def new_order
    @current_order = Hash.new
    'A new order has been opened please view the menu'
  end

  def cancel_order
    'Your current order has been cancelled'
    new_order
  end

  def checkout
    total_cost
    puts 'To complete your order, please confirm the total cost:'
    answer = gets.chomp
    raise 'incorrect total cost' if answer.to_i != @final_cost.to_i
    send_text
  end

  private

  def format_key(dish)
    dish.to_s.delete(' ').downcase.capitalize.to_sym
  end

  def add_guards(key, dish, quantity)
    not_on_menu(key, dish)
    not_a_quantity(quantity)
  end

  def not_on_menu(key, dish)
    dish_error = 'the entered dish is not on the menu'
    raise dish_error if (@current_order[key] = menu.search(dish)).nil?
  end

  def not_a_quantity(quantity)
    quantity_error = 'the entered quantity is not a numer'
    raise quantity_error if (quantity.is_a? Integer) == false
  end

  def add_to_current_order(key, dish, quantity)
    quantity.times do
      @current_order[key] = menu.search(dish)
      @current_order[key].quantity += 1
    end
  end

  def delete_guards(key)
    message = 'No such dish in your current order'
    raise message unless @current_order.key?(key)
  end

  def delete_from_current_order(key)
    @current_order[key].quantity -= 1
    @current_order.delete(key) if @current_order[key].quantity < 1
  end

  def send_text
    total_cost
    SMS.new(@current_order, @final_cost)
  end
end

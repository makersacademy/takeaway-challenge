require 'menu.rb'
require 'verification.rb'

# this shows the list of dishes which can be added to an order
class Order
  attr_reader :menu, :current_order, :already_in_list

  def initialize(menu = Menu.new,)
    @menu = menu
    @current_order = {}
    @already_in_list = false
  end

  def view_menu
    menu.list
  end

  def print_menu
    menu.list.each do |key, dish|
      puts "#{dish.name} £#{dish.price}"
    end
  end

  def add(dish, quantity = 1)
    key = dish.to_s.delete(' ').downcase.capitalize.to_sym

    dish_error = 'the entered dish is not on the menu'
    raise dish_error if (@current_order[key] = menu.search(dish)) == nil

    quantity_error = 'the entered quantity is not a numer'
    raise quantity_error if (quantity.is_a? Integer) == false

    quantity.times do
      @current_order[key] = menu.search(dish)
      @current_order[key].quantity +=1
    end
  end

  def delete(dish)
    key = dish.to_s.delete(' ').downcase.capitalize.to_sym

    message = 'No such dish in your current order'
    raise message if !(@current_order.key?(key))

    @current_order[key].quantity -=1
    @current_order.delete(key) if @current_order[key].quantity < 1
  end

  def checkout
    
  end
end

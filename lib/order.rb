require 'menu.rb'
#require 'verification.rb'

# this shows the list of dishes which can be added to an order
class Order
  attr_reader :menu, :current_order, :already_in_list

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = {}
    @already_in_list = false
  end

  def view_menu
    menu.list
  end

  def print_menu
    menu.list.each do |key, dish|
      puts "#{dish.name} £#{dish.price},"
    end
  end

  def add(dish)
    key = dish.to_s.delete(' ').downcase.capitalize.to_sym
    @current_order[key] = menu.search(dish)
    @current_order[key].quantity +=1
  end

  def delete(dish)
    # guard if not in list
    key = dish.to_s.delete(' ').downcase.capitalize.to_sym
    @current_order[key].quantity -=1
    @current_order.delete(key) if @current_order[key].quantity < 1
  end
end

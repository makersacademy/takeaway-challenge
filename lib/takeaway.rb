require_relative 'restaurant.rb'

class Takeaway
  
  attr_reader :restaurant, :order_log
  
  def initialize(restaurant=Restaurant.new, order=Order.new)
    @action ||= nil
    @restaurant = restaurant
    @order_log = order
  end
  
  def menu
    read_list
    get_choice
  end
  
  def get_choice
    @action ? @action : @action = gets.chomp
    display_menu
  end
  
  def order(item, capacity=1)
    return "Please choose an item in the menu" unless self.restaurant.menu.has_key?(item.capitalize)     #refactor for SRP 
    check = item.capitalize
    checked_item = {"#{check}"=> self.restaurant.menu[check]}
    capacity.times { order_log.add(checked_item)}
  end
  
  
  private 
  
  def display_menu
    restaurant.own_menu
  end
  
  def read_list
    File.open("./lib/restaurants_list.txt", "r") do |file|
      while line = file.gets
        puts line
      end
    end
  end   
 
  
end
require_relative 'restaurant.rb'
require_relative 'order.rb'

class Takeaway
  
  attr_reader :restaurant, :order_log
  
  def initialize(restaurant = Restaurant.new, order=Order.new) 
    @action ||= nil 
    @restaurant = restaurant 
    @order_log  = order 

  end
  
  def menu
    read_list
    choice
  end
  
  def choice
    @action ? @action : @action = gets.chomp
    display_menu
  end
  
  def order(item, capacity=1) 
    return "Please choose an item in the menu" unless item_exist?(item)
    add_to_basket(item, capacity)
    "#{capacity} x #{item} added to your order."
  end 
  
  def check_order
  self.order_log.check_order
  end
  
  def clear_order
    self.order_log.clear_order
  end
  
  def total 
    self.order_log.calculate_total
  end
  
  private 
  
  def display_menu
    restaurant.own_menu
  end
  
  def item_exist?(item)
    self.restaurant.menu.key?(item.capitalize)
  end
  
  def add_to_basket(item, capacity)
    check        = item.capitalize 
    checked_item = {check.to_s => self.restaurant.menu[check]} 
    capacity.times { order_log.add(checked_item)} 
  end
  
  def read_list
    File.open("./lib/restaurants_list.txt", "r") do |file|
      while line = file.gets
        puts line
      end
    end
  end   
 
  
end

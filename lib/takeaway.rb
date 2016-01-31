require_relative 'restaurant.rb'
require_relative 'order.rb'
require_relative 'twilio_messager'
require 'dotenv'

class Takeaway
  
  attr_reader :restaurant, :order_log, :messager
  
  def initialize(restaurant = Restaurant.new, order=Order.new, messager=Messager.new) 
    @action ||= nil 
    @restaurant = restaurant 
    @order_log  = order 
    @messager = messager
  end
  
  def menu
    boot_strap
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
    order_log.check_order
  end
  
  def clear_order
    order_log.clear_order
  end
  
  def total 
    order_log.calculate_total
  end
  
  def check_out(total)
    return "The total is not correct or no order has been made!" if total_error(total)
    messager.send_sms("Thank You! You will receive your order by #{time_format}. Total = £#{total}")
    close_order
  end
  
    private 
  
  def display_menu
    restaurant.own_menu
  end
  
  def item_exist?(item)
    restaurant.menu.key?(item.capitalize)
  end
  
  def total_error(total)
    total != order_log.total || total <= 0
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
  
  def boot_strap
    Dotenv.load
  end
  
  def time_format
    (Time.now + 3600).strftime("%H:%M:%S")
  end
  
  def close_order
    clear_order
    "Thank You! You will receive a confirmation text for you order."
  end
 
  
end

require_relative 'restaurant.rb'

class Takeaway
  
  attr_reader :restaurant
  
  def initialize(restaurant=Restaurant.new)
    @action ||= nil
    @restaurant = restaurant
  end
  
  def menu
    read_list
    get_choice
  end
  
  def get_choice
    @action ? @action : @action = gets.chomp
    display_menu
  end
  
  def display_menu
    restaurant.own_menu
    #puts "Pizza - £10.00"
    #puts "Pasta - £8.00"
    #puts "Milanese - £14.00"
  end
  
  private 
  
  def read_list
    File.open("./lib/restaurants_list.txt", "r") do |file|
      while line = file.gets
        puts line
      end
    end
  end   
 
  
end
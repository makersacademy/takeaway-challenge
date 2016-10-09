# require_relative 'menu'
require 'csv'

class Customer

  attr_reader :order

  def initialize
    @order = order
  end

  def menu
    file = CSV.read("./lib/menu.csv")
    puts file
    puts "Here are the menu items."
  end

  def new_order
    puts "Please enter a menu choice: "
    @order = gets.chomp.to_i
    I want to take the meal that customer has selected,
    scan the csv document for that meal.
    if it exists, add that meal to the order.
  end

end

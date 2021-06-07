require_relative 'menu'

class Order 
  attr_reader :meals

  def initialize
    @meals = []
  end

  def add(dish)
    @meals << dish
  end

  def place_order
    puts "Would you like to place your order?"
    @answer = gets.chomp
    message
  end

  def verify
    @meals
  end

  def order_ok?
    @answer.downcase == 'yes'
  end

  def message
    "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}" if order_ok?
  end
end
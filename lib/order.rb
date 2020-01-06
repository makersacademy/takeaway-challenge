require_relative 'takeaway'

class Order

  attr_accessor :thisorder
  
  MENU = { 9.50 => "Burger", 3.00 => "Fries", 5.50 => "Shake",
  12.00 => "Chicken", 7.50 => "Pizza" }

  def initialize
    @thisorder = []
    @nameorder = []
  end

  def add_to_order
    puts "What would you like to order?"
    input = gets.chomp
    @thisorder << Order::MENU.key(input)
    @nameorder << input
  end

  def return_total
    puts "Your total amounts to #{total}"
  end

  def view_basket
    puts "Your basket is "
    @nameorder.each do |item, _key| puts "#{item}"
    end
  end

  def total
    @thisorder.sum
  end


end

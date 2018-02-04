require_relative 'menu'

class Order

  attr_reader :trolley, :menu

  def initialize
    @trolley = {}
    @menu = Menu.new
  end

  def add(dish, quantity)
    trolley << {dish.to_sym => quantity}
    puts "Thank you. Your #{dish} dish was added #{quantity} times in your trolley"
  end


end

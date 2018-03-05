require './lib/menu.rb'

class UserInterface

  attr_reader :order

  def initialize
    @cost = 0.0
  end

  def user_getter
    user_input = gets.chomp
    @order = user_input.split(", ")
    @customer_sum = @order.pop
  end

  def user_input_modifier
    menu = Menu.new
    order.each do |element|
      @cost += menu.prices(element)
    end
  end

  def correct_cost
    if @customer_sum.to_f != @cost.round(2)
      raise Exception.new("Customer's intended cost is different from actual cost")
    end
  end
end

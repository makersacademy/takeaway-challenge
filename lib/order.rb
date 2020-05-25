require_relative 'menu'
require_relative 'takeaway'

class Order
  attr_reader :choice, :menu

  def initialize
    @choice = {}
    @tot_cost = 0
    @menu = Menu.new
  end

  def sum_cost(food)
    input = food
    @menu.menu.each do |k, v|
      if input == k
        @tot_cost += v
      end
    end
  end

  def summary
    puts "your meal will cost £#{@tot_cost}"

  end

  def value
  end
end

require_relative 'menu'
require_relative 'takeaway'

class Order
  attr_reader :choice, :menu

  def initialize
    @food_array = []
    @tot_cost = 0
    @menu = Menu.new
  end

  def sum_cost(food)
    @food_array << food
    @menu.menu.each do |k, v|
      if k == food
        @tot_cost += v
      end
    end
  end

  def sum_food(food)
  end

  def summary
    result = @food_array.each_with_object(Hash.new(0)) { |food, counts| counts[food] += 1 }
    bresult = result.map { |h| h.join ' x ' }.join ' & '
    puts "you've ordered #{bresult}, your meal will cost £#{@tot_cost}"

  end
end

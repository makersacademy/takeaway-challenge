require './lib/menu.rb'

class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    @basket[dish] += quantity
  end

# commented out to test double instead
  # def total(list)
  #   total = 0
  #   @basket.each do |k, v|
  #     total += v * (list[k])
  #   end
  #   "Total: £#{total}"
  # end

end

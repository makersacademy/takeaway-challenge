require_relative 'menu'

class Order

  include Menu

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish, quantity)
    dishes.include?(dish) ? (dishes[dish]+=quantity) : (dishes[dish]=quantity)
  end

  def total
    dishes.inject(0) {|total, (dish, quantity)| total += price(dish)*quantity}
  end

  def empty?
    dishes.empty?
  end
end

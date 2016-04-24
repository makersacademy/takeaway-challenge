require_relative 'dish.rb'
class Menu
  attr_reader :dishes

  def initialize(dishes:)
    @dishes = [dishes]
  end

  def print
    dishes.each{ |dish| "#{dish.name}: £%0.2f" % [dish.price] }
  end

  def have_dish?(dish)
    dishes.include?(dish)
  end
end

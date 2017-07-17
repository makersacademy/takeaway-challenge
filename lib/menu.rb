require_relative '../data/dishes.rb'

class Menu

  attr_reader :dishes

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def to_s
    dishes.map { |dish, price| "#{dish}, price = £#{price}" }.join("\n")
  end

  def include?(dish)
    dishes.keys.include?(dish)
  end

end

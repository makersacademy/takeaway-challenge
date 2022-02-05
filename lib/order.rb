require_relative '../lib/menu.rb'

class Order
  attr_reader :order, :total, :dishes

  def initialize
    @dishes = {}
    @total = []
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end
end

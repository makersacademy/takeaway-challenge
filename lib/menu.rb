require_relative 'module_checkout'

class Menu
  include Checkout1
  attr_reader :list, :current_order, :total
  def initialize
    @list = { Burger: 5, Pizza: 10, Coke: 1 }
    @current_order = {}
    @total = 0
  end

  def add(item, quantity = 1)
    fail 'Sorry, that item isn\'t on our menu' unless list.key?(item)
    @total += list[item] * quantity
    current_order[item] = quantity
  end
end

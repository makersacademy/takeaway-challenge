#require 'terminal-table'

class Menu

  def initialize
    @list = {margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7}
    @ordered = {}
  end

  def choose(amount, pizza)
    raise "Your choice is not on the menu" unless list.include?(pizza.to_sym)
    ordered.store(pizza.to_sym, amount)
  end

  attr_reader :list, :ordered
end

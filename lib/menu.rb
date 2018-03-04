require_relative 'order.rb'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      1 => ["prawn crackers", 199],
      2 => ["mini spring rolls", 349],
      3 => ["vagetable dumplings", 599],
      4 => ["chicken pad thai", 649]
    }
  end

  def read_menu
    @dishes.map { |k, v| "#{k}. #{v[0]} £#{v[1]/100.0}" }.join("\n")
  end
end

require_relative 'order.rb'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      1 => ["prawn crackers", 1.99],
      2 => ["mini spring rolls", 3.49],
      3 => ["vagetable dumplings", 5.99],
      4 => ["chicken pad thai", 6.49]
    }
  end

  def read_menu
    @dishes.map { |k, v| "#{k}. #{v[0]} £#{v[1]}" }.join("\n")
  end
end

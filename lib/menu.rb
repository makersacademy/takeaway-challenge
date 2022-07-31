class Menu
  attr_accessor :dishes
  DEFAULT_DISHES = {
    "Beef Burger" => 6.0,
    "Chicken Burger" => 5.0,
    "Chips" => 2.5,
    "Soft Drink" => 1.5
  }.freeze
  
  def initialize(dishes = DEFAULT_DISHES)
    @dishes = dishes
  end

  def list
    @dishes.each_with_index do |(key, value), index|
      puts "#{index + 1}- #{key} £#{value}"
    end
    "What would you like to order?"
  end
end

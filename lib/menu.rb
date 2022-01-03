class Menu
  attr_accessor :dishes
  DEFAULT_DISHES = {
    "Beef Burger" => 6,
    "Chicken Burger" => 5,
    "Chips" => 2.50,
    "Soft Drink" => 1.50
  }.freeze
  
  def initialize(dishes = DEFAULT_DISHES)
    @dishes = dishes
  end

  def list
    @dishes.each_with_index do |(key, value), index|
      puts "#{index + 1}- #{key} £#{value}"
    end
  end
end

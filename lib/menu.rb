require_relative 'order'

class Menu
  attr_reader :menu
  
  def initialize
    @menu = [
      { "Margherita Pizza" => 8 }, 
      { "TBS" => 10 }, 
      { "Holy Pepperoni" => 11 }, 
      { "Guindilla in the mist" => 10.50 },
      { "The Aubergine" => 10.50 }
    ]
  end

  def print_menu
    counter = 1 
    @menu.each do |pizza|
      pizza.each do |key, value| 
        puts "#{counter}. #{key}: £#{value}"
        counter += 1
      end
    end
  end
end

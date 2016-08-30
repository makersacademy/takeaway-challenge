require_relative 'order'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
                "chicken" => 4.50,
                "fish" => 5.00,
                "veg" => 6.50
              }
  end

  def print
    dishes.each do |item, price|
      "#{item.to_s.capitalize} is £#{sprintf('%.2f', price)}"
    end
  end
end

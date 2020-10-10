require 'restaurant'

module Printer

  def self.print(restaurant)
    @menu = restaurant.menu
    @menu.map do |dish, price|
       puts "#{dish.to_s}: £#{price.to_s}0"
    end
  end
end

require 'restaurant'

module Printer

  def self.menu_printer(menu)
    counter = 1
    menu.map do |dish, price|
       puts "#{counter}. #{dish.to_s}: £#{price.to_s}0"
       counter += 1
    end
  end
end

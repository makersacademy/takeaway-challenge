require 'csv'

class Menu

  attr_reader :menu

  def initialize
    @menu = menu
  end
  
  def menu
    menu = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      menu << { name: name, price: price.to_i }
    end
    menu
  end

  def print
    @menu.each do |x|
      puts "#{x[:name]} #{x[:price]}"
    end
  end

end

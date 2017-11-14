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

  def items
    items = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      items << "#{name} £#{price}"
    end
    items.join("\n")
  end

end

require './lib/dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
      { :name => "Chips", :price => 2 },
      { :name => "Onion rings", :price => 1 },
      { :name => "Cheese burger", :price => 10 },
      { :name => "Chicken burger", :price => 9 },
      { :name => "Chicken kebab", :price => 8 },
      { :name => "Chips", :price => 2 },
      { :name => "Chips", :price => 2 }
    ]
  end

  def read_menu
    @dishes.each { |dish| puts "#{dish[:name]} - £#{dish[:price]}" }
  end
end

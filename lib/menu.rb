class Menu

  attr_reader :dishes
  
  def initialize
    @dishes = [
      { :name => "Chips", :price => 2 },
      { :name => "Onion rings", :price => 1 },
      { :name => "Cheese burger", :price => 10 },
      { :name => "Chicken burger", :price => 9 },
      { :name => "Chicken kebab", :price => 8 },
    ]
  end

  def view_menu
    @dishes.each { |dish| puts "#{dish[:name]} - £#{dish[:price]}" }
  end
end

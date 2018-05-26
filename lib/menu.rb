class Menu

  attr_accessor :name, :price, :items

  def initialize(name, price = 1)
    @name = name
    @price = price
    @items = { "sushi" => 5, "noodles" => 7 }
  end

  def display_menu
    puts @items
  end
end

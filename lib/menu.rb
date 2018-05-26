class Menu

  attr_accessor :name, :price, :items

  def initialize(name, price = 1)
    @name = name
    @price = price
    @items = { "sushi" => 5, "noodles" => 7, "edamame" => 3 }
  end

  def display_menu
    @items.each do |item, price|
      puts "#{item} " + "£#{price}"
    end
  end
end

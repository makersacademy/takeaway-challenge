class Menu

attr_reader :menu

MENU = {"Burger" => 5, "Fries" => 3, "Drink" => 2}

  def initialize
    @menu = MENU
  end

  def print
    puts "----------MENU----------"
    @menu.each { |item, price| puts "Item: #{item}, Price: £#{price}"}
    puts "------------------------"
    end
end

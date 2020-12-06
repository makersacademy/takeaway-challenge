class Menu
  attr_accessor :menu

  def initialize
    @menu = {
      "Spring roll" => 0.99,
      "Char sui bun" => 3.99,
      "Pork dumpling" => 2.99,
      "Peking duck" => 7.99,
    }
  end

  def show_menu
    puts "---------------------------------------"
    puts "*               MENU                  *"
    puts "---------------------------------------"
    @menu.each do |item, price|
      puts "#{item} ........ #{price}".center(40)
    end
    puts "---------------------------------------"
  end

  def add2_menu
    puts "Please add the name of the item:"
    item = gets.chomp
    puts "Please add the price of the item:"
    price = gets.chomp
    @menu[item] = price
  end
end

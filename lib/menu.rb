class Menu
  attr_reader :menu

  def initialize
    @menu = {
      "Chicken burger" => 10,
      "Beef burger" => 12,
      "Fish dog" => 11,
      "Hallumi fritter burger" => 8,
      "Sloppy Joe dog" => 9,
      "Truffle fries" => 4,
      "Mac & Cheese" => 5,
      "Corn ribs" => 4,
    }
  end

  def printed_menu
    menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end
end

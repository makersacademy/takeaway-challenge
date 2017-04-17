class Menu

  attr_reader :items

  def initialize
    @items = {  "Hamburger" => 1,
                "Cheeseburger" => 1,
                "Pizza" => 2,
                "Hot Dog" => 1
              }
  end

  def read_menu
    items.each {|item,price| puts "#{item}: £#{price}"}
  end

end

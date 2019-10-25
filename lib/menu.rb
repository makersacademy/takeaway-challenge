class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
         burger:3,
         fries:4,
         milkshake:5,
         doughnut:6,
         cake:7
       }
  end

  def read_menu
    @menu_items.collect do |key, value|
      "#{key}  : £#{value}"
    end
  end

  def greeting
    puts "Welcome to McCampbell's Burgers"
  end
end

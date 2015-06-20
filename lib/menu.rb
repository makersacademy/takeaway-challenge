require_relative 'order_form'

class Menu

  attr_reader :menu

  def initialize

    @menu = { "Chicken Rice" => 2,
      "Laksa"                => 3,
      "Hokkien Mee"          => 4,
      "Additional Egg"       => 1,
      "Soup"                 => 1,
      "Tao Hui"              => 1,
      "Oolong Tea"           => 1}
  end

  def show_menu
    puts "What would you like to have?"
    @menu.each do |dish, price|

      menu_line = "#{dish}".ljust(15, '-') + "$#{price}".rjust(15, '-')
      puts menu_line
    end
  end
end
#understands dishes and prices


class Menu
  attr_reader :menu_list, :order

  def initialize
    puts """
    Welcome to the \"Pizza Place\"!
    Choose your order from below!

    Commands : menu.print  # See menu
    """
    @menu_list = {"cheese and tomato" => 5.99,
                  "chicken pizza" => 6.99,
                  "three cheeses" => 6.99,
                  "pepperoni pizza" => 7.99,
                  "vegetarian pizza" => 7.99,
                  "pizza especial" => 8.99,
                  }
    @order = {}
  end



  def print
    @menu_list.each do |dish, price|
      puts "#{dish.capitalize.ljust(20)} : £#{price}"
    end
  end
end

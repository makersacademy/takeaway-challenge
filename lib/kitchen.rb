require_relative 'order'

class Kitchen

  attr_reader :new_order, :menu

  def initialize
    @menu = mains

  end

  def print_menu
    puts " \/\/\/\/\/\/\/\/\/ ".center(30)
    puts "THE MENU OF MASH".center(30)
    puts "()()()()()()()()()()".center(30)
    puts ""
    puts mains.map{ |mains, price| "#{mains}: #{price}".center(30) }
    puts ""
    puts ""
  end


  def mains
    {
      "Pie n Mash" => 5.25,
      "Bangers n Mash" => 7.25,
      "Eel n Mash" => 3.45,
      "Pizza n Mash" => 6.78,
      "Burger n Mash" => 4.87
    }

  end

  def create_order(dish)
    @new_order = Order.new(menu, dish)  #attribute

  end


end

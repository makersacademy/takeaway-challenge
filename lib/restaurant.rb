require_relative 'order'

class Restaurant

  attr_reader :new_order, :menu

  def initialize
    @menu = pizza
  end

  def print_menu
    puts "===================="
    puts "The Menu".center(20)
    puts "===================="
    puts ""
    puts pizza.map{ |pizza,price| "#{pizza}: #{price}" }
    puts ""
  end

  def pizza
    {
      "Marinara" => 5.95,
      "Margherita" => 7.50,
      "Boscaoilia" => 8.95,
      "Diavola" => 8.95,
      "Napoli" => 8.95,
      "Capriccosa" => 9.25,
      "Tartufata" => 9.95,
      "Capagnola" => 9.95,
      "Margherita Parmigiana" => 10.45,
      "Salsiccia & Friarieli" => 10.95,
      "Calzone Ripieno" => 11.45,
      "San Daniele" => 11.95
    }
  end

  def place_order(meal)
    @new_order = Order.new(menu, meal)
  end


end

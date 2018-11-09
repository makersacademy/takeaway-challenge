class Pizzeria
  attr_reader :menu

  MENU = { "marinara" => 2, "margherita" => 3,
           "funghi" => 4, "napoletana" => 5,
           "diavola" => 6, "capricciosa" => 6,
           "boscaiola" => 7, "quattro formaggi" => 7,
           "quattro stagioni" => 8, "calzone" => 8 }

  def initialize(menu = MENU, order = Order.new)
    @menu = menu
    @order = {}
  end

  def show_menu
    @menu.each { |pizza, price| puts "#{pizza} = £#{price}" }
  end

  





end

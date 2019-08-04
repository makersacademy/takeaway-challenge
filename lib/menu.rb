class Menu
  attr_reader :menu
  def initialize
    @menu = {
      a: 10,
      b: 20,
      c: 30
    }
  end

  def show_menu
    print "Dish Price\n"
    @menu.each{ |dish, price| print "#{dish.to_s} #{price}\n"}
  end

end

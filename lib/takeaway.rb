class Takeaway
  attr_accessor :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def view_menu
    @menu.print
  end

  def add(dish)
    fail "#{dish} is not on the menu" if !@menu.dishes.key?(dish)
    @basket.push(dish)
  end
end

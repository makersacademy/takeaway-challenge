class TakeAway

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Order.new
    @menu = menu
  end

  def add_to_basket(number, quantity = 1)
    quantity.times { @basket.items << @menu.list[number - 1] }
  end

  def display_menu
    puts @menu.pretty_print
  end

end

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new.dishes
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name}: £#{dish.price}"
    end
  end

  def new_order
    @order = Order.new 
  end

end

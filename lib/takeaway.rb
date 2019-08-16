class Takeaway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new.menu)
    @menu = menu
    @basket = {}
  end

  def view_menu
    @menu.display
  end

  def add(dish, quantity)
    error_message = "#{dish} is not available, please choose dishes from menu"
    raise error_message unless @menu.include?(dish)

    @basket[dish] = quantity
    puts "#{quantity}x #{dish}(s) added to your basket"
  end
end

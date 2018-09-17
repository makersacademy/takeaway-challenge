class Order
  attr_reader :menu, :order

  def initialize(menu = Menu)
    @menu_class = menu.new
    @menu = @menu_class.menu
    @order = []
  end

  def list_menu
    @menu
  end

  def choose_item(item)
    raise "Sorry, this item is unavailable here!" unless @menu.include?(item)
    @order << item
  end

  def calculate_sum
    @sum = 0
    @order.each {|x| @sum += @menu[x]}
    @sum
  end

end

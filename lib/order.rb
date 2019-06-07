class Order

  attr_reader :quantity, :dish

  def initialize(menu=Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.view
  end

  def place_order(dish, quantity)
    raise "Item is not on the menu" if !@menu.menu_contents.include?(dish)
    @quantity = quantity
    @dish = dish
    "#{quantity} x #{dish} have been added to your order"
  end

end

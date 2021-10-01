class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = {}
  end

  def add_item(name, price)
    @menu_items[name] = price
  end

  def list_dishes
    menu_items.each do |dish, price|
      "%s: £%.2f" % [dish, price]
    end
  end

  def dish_available?(dish)
    menu_items.key?(dish)
  end
end

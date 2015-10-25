class Takeaway

  attr_reader :my_order

  MENU = { "hotdog"=>1.99, "cheesebuger"=>1.49,
    "Hamburger"=>0.99, "Fries"=>0.89, }

  def initialize
    @my_order = {}
  end

  def read_menu
    MENU
  end

  def order(menu_item)
    if my_order.has_key?(menu_item)
      my_order[menu_item] = my_order[menu_item] + 1
    else
      my_order[menu_item] = 1
    end
  end

  def calculate
    total = 0.0
    my_order.each do |item, quantity|
      item_price = MENU[item]
      total += item_price * quantity
    end
    total
  end
end

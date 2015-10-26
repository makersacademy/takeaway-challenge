require_relative 'menu'
class Takeaway

  attr_reader :my_order, :check_out
  
  MENU = { "hotdog"=>1.99,
          "cheesebuger"=>1.49,
          "Hamburger"=>0.99,
          "Fries"=>0.89, }

  def initialize(menu_klass = Menu.new)
    @menu = menu_klass
    @my_order = {}
    @total = 0.0
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
    my_order.each do |item, quantity|
    item_price = MENU[item]
    @total += item_price * quantity
    end
    @total
  end

  def basket
    raise "Your basket is empty!" if basket.empty?
    my_order
  end

  def check_out
    ("Thank you for your order: £#{@total}")
  end


end

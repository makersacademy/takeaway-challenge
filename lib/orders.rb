require_relative 'bill'

class Orders

  attr_reader :cust_orders, :price_of_orders, :menu

  def initialize
    @cust_orders = {}
    @price_of_orders = []
  end

  def choose_menu(menu = Menu.new)
    @menu = menu
  end

  def cust_order(dish, how_many)
    dish = dish.tr(" ", "_").to_sym
    unless Menu::MENU_SELECTIONS.include? dish
      raise "sorry, dish is not available"
    end
    @cust_orders[dish] = how_many
  end

  def order_conf
    @cust_orders.each do |item, how_many|
      puts "#{item.to_s.tr("_", " ")} x #{how_many}"
    end
  end

end

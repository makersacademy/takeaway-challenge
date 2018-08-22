require_relative 'bill'

class Orders

  attr_reader :cust_orders, :menu

  def initialize
    @cust_orders = {}
  end

  def choose_menu(menu = Menu.new)
    @menu = menu.menu_items
  end

  def cust_order(dish, how_many)
    dish = dish.tr(" ", "_").to_sym
    unless @menu.include? dish
      raise "sorry, dish is not available"
    end
    @cust_orders[dish] = how_many
  end

  def order_conf
    @cust_orders.each do |item, how_many|
      puts "#{item.to_s.tr("_", " ")} x #{how_many}"
    end
  end

  def bill(bill_klass = Bill)
    bill = bill_klass.new(@cust_orders, @menu)
    bill.bill
  end

end

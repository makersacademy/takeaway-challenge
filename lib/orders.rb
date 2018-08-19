require_relative 'sms'

class Orders

  attr_reader :orders, :price_of_orders, :menu

  def initialize
    @orders = {}
    @price_of_orders = []
  end

  def choose_menu(menu = Menu.new)
    @menu = menu
  end

  def cust_order(dish, how_many)
    dish = dish.tr(" ", "_").to_sym
    raise "sorry, dish is not available" unless Menu::MENU_SELECTIONS.include? dish
    @orders[dish] = how_many
  end

  def order_conf
    @orders.each do |item, how_many|
      puts "#{item.to_s.tr("_", " ")} x #{how_many}"
    end
  end

  def bill
    @orders.each do |dish, how_many|
      @price_of_orders << @menu.menu_items[dish] * how_many
    end
    @total_bill = @price_of_orders.sum
  end

  def conf_message(amount, conf = Sms.new)
    raise "please settle the bill" unless @total_bill <= amount
    conf.send_message
  end

end

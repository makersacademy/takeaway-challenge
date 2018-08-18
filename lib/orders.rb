# require_relative 'sms'

class Orders

  attr_reader :orders, :total_bill, :menu

  def initialize
    @orders = {}
    @total_bill = []
  end

  def choose_menu(menu = Menu.new)
    @menu = menu
  end

  def cust_order(dish, how_many)
    dish = dish.gsub(" ", "_").to_sym
    raise "sorry, dish is not available" unless Menu::MENU_SELECTIONS.include? dish
    @orders[dish] = how_many
  end

  def order_conf
    @orders.each do |item, how_many|
      puts "#{item.to_s.gsub("_", " ")} x #{how_many}"
    end
  end

  def bill
    @orders.each do |dish, how_many|
      @total_bill << @menu.menu_items[dish] * how_many
    end
    @total_bill.sum
  end

end

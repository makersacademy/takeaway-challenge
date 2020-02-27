class Menu
  attr_reader :menu, :order
  def initialize
    @menu = { "Pasta" => 9, "Pizza" => 7, "Steak" => 40, "Ice Cream" => 2 }
  end

  def show_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def price(item)
    @menu[item] 
  end
end

class Order
  DEFAULT_QUANTITY = 1
attr_reader :menu, :order
  def initialize
    @menu = Menu.new
    @order = []
  end

  def add_to_order(item, quantity = DEFAULT_QUANTITY)
    raise "That is not on the menu!" if item_doesnt_exist?(item)
    quantity.times {@order << {item => @menu.price(item)}}
    "You have added #{item} to your order"
  end

  def show_order
    @order.each do |item| 
      item.each{|food, price| puts "#{food}: £#{price}"}
    end
  end

  def total
    prices_array = []
    @order.each do |item|
      item.each{|food, price| prices_array << price}
    end
    print "Your total is £" + prices_array.inject(:+).to_s
  end

  def item_doesnt_exist?(item)
    @menu.price(item) == nil
  end
end

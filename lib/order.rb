class Order

  attr_accessor :basket, :order_total
  attr_reader :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
    @order_total = 0.0
  end

  def add(item, quantity = 1)
    @basket[item.capitalize] += quantity if menu.contains?(item)
    puts "Basket after adding #{@basket}"
  end

  def total
    fetch_prices
    "£#{@order_total.round(2)}"
  end

  def check_order_price(price)
    puts "order total: #{@order_total}"
    price == @order_total
  end

  private

  def fetch_prices
    puts "Basket: #{@basket}"
    @basket.each { |item, qty| @order_total += menu.find_price_for(item) }
  end

end

#Order.new.view_menu(true)
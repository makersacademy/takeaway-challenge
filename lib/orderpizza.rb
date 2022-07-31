require './lib/menu'

class Orderpizza < Menu
  attr_reader :basket, :menu

  def initialize(menu = Menu.new.print_menu)
    @menu = menu
    @basket = {}
    @order_total = 0
  end

  def order_total
    @basket.map {|item, price| @order_total += price }
    puts "The price for this order is $#{@order_total}"
    return @order_total
  end

  def add_to_basket(item, quantity = 1)
    @basket[item] = quantity
  end

  def basket
    @basket.each { |item, price| puts "#{item} #{price}" }
  end


end
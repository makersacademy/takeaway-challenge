require "./lib/menu.rb"

class Order

  attr_accessor :basket, :menu, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @subtotal = []
  end

  def add(food)
    @basket << food
  end

  def total_dishes
    @basket.length
  end

  def total_price(total)
    @basket.each do |item|
      @menu.show_menu.each do |name, price|
        @subtotal << price if name == item
      end
    end
    @subtotal.reduce(:+)
  return @subtotal

  end
end

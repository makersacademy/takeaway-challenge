require_relative 'formatter'
require_relative 'menu'
require_relative 'basket'

# in lib/app.rb
class App
  attr_reader :order

  def initialize
    @formatter = Formatter.new
    @menu = Menu.new(@formatter)
    @order = new_order
  end

  private

  def new_order
    basket = Basket.new(@formatter)
    Order.new(@menu, basket)
  end
end

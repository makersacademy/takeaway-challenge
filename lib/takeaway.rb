require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket, :order_cost



  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
    @basket = {}
    @order_cost = Order.new
  end

  def show_menu
    @menu.dishes.dup
  end

  def order(item, number=1)
    @basket["#{item} x#{number}"] = @menu.price(item) * number
    @order_cost.add(price(item,number))
    "You ordered #{item} x#{number}"
  end

  def total
    "Total order cost: £#{@order_cost.total}"
  end

  def check_total
    @order_cost.total == basket_summary
  end

  private

  def price(item, number)
    @menu.price(item) * number
  end

  def basket_summary
    basket_total = 0
    @basket.each do |item, price|
      basket_total += price
    end
    basket_total
  end
  
end

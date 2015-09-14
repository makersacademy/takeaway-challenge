require_relative 'twilio'
require_relative 'menu'

class Customer
  attr_reader :order, :menu,

  def initialize(menu=Menu.new)
    @order = {}
    @menu = menu
  end

  def add(food, quantity=1)
    if @menu.foods.key?(food)
      order.store(food, quantity)
      "#{quantity}x #{food}(s) have been added to your order."
    else
      fail 'Sorry, that item isn\'t available on our menu.'
    end
  end

  def order_total
    if order.empty?
      fail 'You haven\'t placed anything on your order, please choose something from our menu'
    else
    total_order = []
    @order.map do |food, i|
    total_order << "#{food} i#{i} = £#{(@menu.foods[food] * i).round(2)}"
    end
    total_order.join(", ")
  end
  end

#  def checkout(payment)
#    total_payment = @order.map {|food, i| @menu.foods[food] * i}.inject(0, :+)
#    total = total_payment.round(2)
#    if payment >= total
#      'Your order has been received, you should get a confirmation text soon.'
#    else
#      fail "Sorry, you haven't paid the full amount for your order yet"
#    end
#  end

  def total_price
    @order.map {|food, i| @menu.foods[food] * i}.inject(0, :+)
    "Total: £#{total.round(2)}"
  end

end

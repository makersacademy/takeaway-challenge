require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new([{name: "Chocolate Fudge Cake", price: 3.75}, {name: "Lemon Drizzle Cake", price: 3.45}, {name: "Bakewell Tart", price: 2.95}, {name: "Banoffee Pie", price: 3.95}])
    @order = Order.new(menu)
  end

  def take_order(choice)
    order.add_dish(choice)
  end

  def request_total(total)
    order.calculate_total
  end

end

takeaway = Takeaway.new
takeaway.take_order('Chocolate Fudge Cake')
puts takeaway.order.contents

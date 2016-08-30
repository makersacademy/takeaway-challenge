require_relative 'order'

class Takeaway
  attr_reader :order_quantities, :my_total
  LIST = {mushypeas: 2, kebab: 4, fish: 4, chips: 3}

  def show_menu
    LIST.each {|food, price| puts "#{food}: #{price} "}
  end

  def take_order(order_quantities, my_total)
    @order_quantities = order_quantities
    @my_total = my_total
    order = Order.new LIST, @order_quantities, @my_total
    order.total
  end


end

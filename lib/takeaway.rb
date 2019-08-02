class Takeaway

  attr_reader :order, :order_price, :menu

  def initialize
    @order = []
    @order_price = 0
    @menu = { :pepperoni => 10,
             :hawaiian => 12,
             :meat_feast => 15
            }
  end

  def menu_select(order, amount = 1)
    amount.times { @order << @menu.slice(order) }
  end

  def order_total
    @order.each do |order|
      order.each do |key, value|
        @order_price += value
      end
    end
  end

end

# test = Takeaway.new
# test.menu_select(:pepperoni,2)
# test.menu_select(:hawaiian, 2)
# test.order_total
# p test.order_price

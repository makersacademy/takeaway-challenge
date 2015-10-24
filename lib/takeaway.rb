require 'order'

class Takeaway
  attr_reader :name, :number

  def initialize(name = 'no_name',
                 number = '+447479365828',
                 order_klass = Order.new
    )
    @name = name
    @number = number
    @order = order_klass
  end

  def new_order(food, quantity)
    @order.add_order(food, quantity)
  end



end

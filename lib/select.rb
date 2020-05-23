require_relative 'dishes'

class Select
  attr_writer :menu

  def order(dishes)
    @order = dishes
    @order = []
    @menu = [{ toast: 3, cereal: 2, coffee: 2 }]
    # order.push(dishes)
  end
end

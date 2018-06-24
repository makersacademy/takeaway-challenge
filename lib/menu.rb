class Menu


  def initialize 
    @dishes = { "oreo cookie sandwich " => 1, "chocolate eggo waffle" => 2, 
    "crispy chicken nuggets" => 3, "tangy beef jerky" => 1, "spicy lamb donner" => 4 }
    @order_list = []
  end


  def add_to_order_list(order, price)
    @order_list << {order: order, price: price.to_sym}
  end


def order1
@order_list
end


  def total
    total = order_list.inject(0)
  end
end



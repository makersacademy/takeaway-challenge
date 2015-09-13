class Order

  attr_reader :order

  def initialize
    @order = {}
  end

  def add item, number, menu
    line= menu.select_food(item.to_s)
    line.each{|k,v| v[1]=number}
    @order.merge!(line)
  end

  def total
    tot_order=[]
    @order.values.each{|v| tot_order<< v[0]*v[1]}
    tot_order.inject{|a, b| a + b }.round(2)
  end

end

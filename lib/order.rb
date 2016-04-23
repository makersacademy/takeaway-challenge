class Order

  attr_reader :my_order

  def initialize(menu)
    @my_order = []
    @menu = menu
  end

  def add(item, number = 1)
    number.times {my_order << @menu.dishes.find {|dish| dish.name == item }}
  end

  def order_cost
    @total = 0
    my_order.each do |item|
      @total += item.price
    end
    @total
  end

  
end

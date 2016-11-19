class Menu
  attr_reader :choices, :my_order, :order
  def initialize(order_klass)
    @choices ={burger: 10,  salad: 5, coke: 2}
    @my_order = []
    @order = order_klass
  end

  def select_dish(dish, portions = 1)
    selected_dish = @choices.select{|k,v | k == dish}
    portions.times { @my_order<< selected_dish}
  end

end

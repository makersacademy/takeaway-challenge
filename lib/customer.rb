class Customer
  
  def initialize
    @order_selection = []
    @total_price = []
    @sum = 0
  end

  def add_order(menu,food)
    food.downcase!
    if menu.menu.include?(food) == false
      raise "the order is not in the menu"
    end
    @order_selection.push(food)
    @total_price.push(menu.menu[food])

  
  end

  def order_selected
    @order_selection
  end

  
  def total_order
    @sum = 0
    @total_price.each { |bill| @sum += bill }
    return @sum
  end
end

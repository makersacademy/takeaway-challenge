class Customerorder

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
    @order_selection.each do |food| @total_price << menu.menu[food]
    end
  
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

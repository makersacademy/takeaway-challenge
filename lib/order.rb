class Order
  def initialize(menu)
    @order = {}
    @menu = menu
    @complete = false
    @total = 0
  end

  def add(dish)
    fail "This dish doesn't exist on the menu" unless @menu.remove(dish)
    @order[dish.name] = dish.price
  end

  def remove(dish)
    @order.delete(dish.name)
  end

  def check_dishes
    return "Nothing on order" if @order.empty?
    return @order.map {|name, price| "#{name}: £#{price}"}
  end

  def check_price
    return "Nothing on order" if @order.empty?
    @order.each { |name, price| @total += price}
    return "£#{@total}"
  end

  def submit
    @complete = true
  end

  def completed?
    return @complete
  end
end
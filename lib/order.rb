class Order

  attr_reader :order, :menu, :total

  def initialize(menu = Menu)
    @order = {}
    @menu = menu.new
    @total = 0
  end

  def add(item, quantity)
    if @order.include?(item)
      current_quantity = @order[item]
      current_quantity += quantity
      @order[item] = current_quantity
    else
      @order[item] = quantity
    end
  end

  def calc_total
    price = 0
    @order.each do |item, quantity|
      @total += @menu.dishes[item] * quantity
    end
    "The order comes to £#{@total}"
  end

end

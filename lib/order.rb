class Order

  attr_reader :order_list, :menu, :total

  def initialize(menu = Menu)
    @order_list = {}
    @menu = menu.new
    @total = 0
  end

  def add(item, quantity)
    if @order_list.include?(item)
      current_quantity = @order_list[item]
      current_quantity += quantity
      @order_list[item] = current_quantity
    else
      @order_list[item] = quantity
    end
  end

  def total
    price = 0
    @order_list.each do |item, quantity|
      @total += @menu.dishes[item.to_sym] * quantity
    end
    "The order comes to £#{@total}"
  end

end

class Order
  def initialize
    @current_order = []
    @order_total = 0
  end

  def add_to_basket(dish)
    @current_order << dish
  end

  def remove_from_basket(choice)
    @current_order.delete_at(choice)
  end

  def basket
    @current_order.each do |item|
      puts "#{@current_order.index(item) + 1}. #{item.name} - £#{item.price}"
    end
    @current_order
  end

  def total
    @order_total = 0
    @current_order.each do |item|
      @order_total += item.price
    end
    @order_total
  end

end

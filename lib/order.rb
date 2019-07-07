class Order
  def initialize(dish)
    @current_order = []
    @current_order << dish
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
    @current_order.each do |item|
      @order_total += item.price
    end
    @order_total
  end

end

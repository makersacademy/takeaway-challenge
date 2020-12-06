class Order
  def initialize(order_list, exact_total, text_class = Text)
    @order_list = order_list
    @exact_total = exact_total
    @text_class = text_class
  end

  def see
    @order_list
  end

  def total
    @total = 0
    @order_list.each do |dish, quantity|
      @total += dish.price * quantity
    end
    return @total
  end

  def send_text
    raise "Incorrect Total" unless @exact_total == total
    @text = @text_class.new
  end
end

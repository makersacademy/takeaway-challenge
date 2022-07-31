class Order
  attr_reader :order_dishes

  def initialize
    @order_dishes = []
  end

  def add(dish)
    @order_dishes << dish
  end

  def print_receipt
    "Order:\n#{order_dishes_to_string}Total: £#{'%.2f' % total}"
  end

  def order_dishes_to_string
    s = ""
    @order_dishes.each do |dish|
      s += "#{dish.name} - #{'%.2f' % dish.price}\n"
    end
    s
  end

  def total
    @order_dishes.inject(0) { |sum, dish| sum + dish.price }
  end
end
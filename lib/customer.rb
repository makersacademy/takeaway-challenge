class Customer

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(dish, number = 1)
    number.times { @order << dish }
  end

  def order_total
    total = 0
    @order.each { |dish| total += dish.price }
    total
  end

  def reciept
    @order.each do |dish|
      puts "#{dish.name} : £#{'%.2f' % (dish.price/100)}"
    end
  end
end

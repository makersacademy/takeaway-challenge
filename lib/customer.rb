class Customer

  def initialize
    @order = []
  end

  def order
    @order
  end 

  def add_to_order(item, number=1)
    number.times do
      @order << item
    end
  end 

  def order_from(takeaway, total)
    takeaway.check_order(order, total)
  end

end
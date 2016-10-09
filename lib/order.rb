class Order

  attr_reader :order

  def initialize(order)
    @order = order
  end

  def confirm_total
    order.each do |item|
      item.each do |dish|
        print dish
      end
    end
  end
end

class TakeAway

  attr_reader :messager, :order

  def initialize(messager = Messager.new, order = Order.new)
    @messager = messager
    @order = order
  end

  def complete_order
    output ="order price not correct, please review"
    fail output unless is_correct_amount?
  end



  private

    def is_correct_amount?
      order.bill == order.customer_price
    end

end

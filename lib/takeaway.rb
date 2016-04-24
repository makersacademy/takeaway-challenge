class TakeAway

  attr_reader :messager, :menu

  def initialize(messager)
    @messager = messager
    @menu = menu
  end

  def complete_order(amount,customer_price)
    @amount, @customer_price = amount, customer_price
    output ="order price not correct, please review"
    fail output unless is_correct_amount?
    messager.send_text(amount)
    output = "Order confirmed, thank you! You will receive a text shortly..."
  end



  private

    def is_correct_amount?
      @amount == @customer_price
    end

end

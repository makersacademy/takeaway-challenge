class TakeAway

  attr_reader :messager, :menu

  def initialize(messager)
    @messager = messager
    @menu = menu
  end

  def complete_order(amount,customer_price)
    @amount = amount
    @customer_price = customer_price
    output ="order price not correct, please review"
    fail output unless correct_amount?
    messager.send_text(amount)
    output = "Order confirmed, thank you! You will receive a text shortly..."
  end



  private

    def correct_amount?
      @amount == @customer_price
    end

end

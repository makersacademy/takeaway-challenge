class Order

  attr_reader :order, :total

  def initialize(order)
    @order = order
    @total = 0
    @text_confirm_order = ConfirmationTextSender.new
  end

  def confirm_order
    total = confirm_total
    confirm_message(total)
    text_confirm_order(total)
  end

  def confirm_total
    order.each do |item|
      price = item.last.to_f
      @total += price
    end
    total.round(2)
  end

  def confirm_message(total)
    puts "The total for your order is £#{total}."
  end

  def text_confirm_order(total)
    @text_confirm_order.send_message(total)
  end
end

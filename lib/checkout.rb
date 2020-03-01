class Checkout
  def initialize(message = Message.new)
    @message = message
  end
  def order_confirmation(order_details)
    display_order(order_details)
    @message.send
  end

  private

  def display_order(order_details)
    order_header
    show_basket(order_details)
  end

  def order_header
    puts "Here is your order: "
    puts ""
  end

  def show_basket(order_details)
    sum = 0
    order_details.map{
      |item| puts "x#{item[:ordered]} #{item[:dish]}      £#{item[:price] * item[:ordered]}"
    sum += (item[:price] * item[:ordered])}
    puts"total:      £#{sum}"
  end
end

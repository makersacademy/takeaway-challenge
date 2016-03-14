class Takeaway

  def initialize(menu= Menu.new, order_klass=Order, messenger_klass=Messenger, phone=ENV['TWILIO_DESTINATION_PHONE'])
    @menu = menu
    @order_klass = order_klass
    @order = @order_klass.new
    @messenger_klass = messenger_klass
    @messenger = @messenger_klass.new
    @phone = phone
  end

  def select_item(dish, number=1)
    raise "#{dish} is not on the menu." unless on_menu?(dish)
    number.times{@order.add_item(dish)}
  end

  def confirm_order(assumed_total)
    error_message = "Does not match total of #{@order.calc_total}"
    raise error_message unless matches_total?(assumed_total)
    send_text
  end

private

  def on_menu?(dish)
    @menu.view.include? dish
  end

  def matches_total?(assumed_total)
    @order.calc_total == assumed_total
  end

  def send_text
    text_message = "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}."
    @messenger.send(text_message, @phone)
  end

end

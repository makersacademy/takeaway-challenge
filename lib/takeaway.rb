require ("bundler")
Bundler.require()

class Takeaway

  def initialize(menu, order_handler)
    @menu = menu
    @order = order_handler
    acc_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(acc_sid, auth_token)
  end

  def add_to_menu(dish)
    @menu.add_to_menu(dish)
  end

  def menu_list
    @menu.list
  end

  def order_dish(number)
    @order.add_to_basket(@menu.dishes[number - 1])
  end

  def list_order
    order.basket
  end

  def remove_from_order(number)
    @order.remove_from_basket(number)
  end

  def total
    @order.total
  end

  def complete_order
    delivery_time = estimate_delivery_time
    send_text(delivery_time)
  end

  def estimate_delivery_time
    Time.now + (60 * 30)
  end

  def send_text(delivery_time)
    @client.messages.create(
      to: ENV['MY_PHONE_NUMBER'],
      from: "+441290211723",
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

end

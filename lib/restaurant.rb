require_relative 'my_order'
require_relative 'twilio_interface'

class Restaurant

  attr_reader :the_menu, :customer_order, :twilio_interface,
              :send_to_order, :account_sid, :auth_token

  # default_auth_keys

  def initialize
    @the_menu = [
      { Name: 'Tikka_Masala', Price: 5 },
      { Name: 'Naan', Price: 2 },
      { Name: 'Rice', Price: 2 }]
    @customer_order = MyOrder.new
    @account_sid = <ENV>
    @auth_token = <ENV>
  end

  def input_selection(phone_number, selections)
    store_phone_number(phone_number)
    @send_to_order = []
    selections.each { |selection|
      the_menu.each { |menu_item| if menu_item[:Name] == selection
                                    @send_to_order << menu_item
                                  end
      }
    }
  end

  def confirm_selection(phone_number, selections)
    input_selection(phone_number, selections)
    customer_order.store_order = @send_to_order
    "You have selected #{send_to_order.map { |x| x[:Name] }.join(" & ")}"
  end

  def store_phone_number(phone_number)
    customer_order.import_phone_number(phone_number)
  end

  def access_phone_number
    customer_order.customer_phone_number
  end

  def confirm_total
    customer_order.sum_up_total
  end

  def confirm_order_text
    one_hour = (60 * 60)
    an_hour_from_now = Time.new + one_hour
    "Thank you - your order will arrive at #{an_hour_from_now}"
  end

  def send_confirmation_text(restaurant_no = '+441915804625', customer_no = access_phone_number)
    new_twilio_interface
    twilio_interface.new_message(restaurant_no, customer_no, confirm_order_text)
    twilio_interface.message.body
  end

  def new_twilio_interface(arg1 = account_sid, arg2 = auth_token)
    @twilio_interface = TwilioInterface.new(arg1, arg2)
  end

end

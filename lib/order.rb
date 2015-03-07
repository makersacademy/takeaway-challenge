class Order

  attr_accessor :customer_order, :send_sms, :message_sent

  def initialize(menu, customer)
    @customer_order = {}
    @menu = menu
    @customer = customer
    @send_sms = false
    @message_sent = false
  end

  def place_order(items, total)
    items.each_key do |key|
      @customer_order[key] = items[key], sub_total(items[key], key)
    end
    check_total(total)
    send_sms_message
  end

  def check_total(total)
    if total == calc_total
       send_txt(true)#This is weird, using send_sms=(true) did not work, @send_sms would change back to false. But send_txt(true) worked???
    else
      raise "Total is incorrect, recalculate your order"
      clear_order# Want this to happen after the error, need to work out why this isn't happening in irb but the test still passes?
    end
  end

  def send_sms_message
    if send_sms == true
      set_message_sent(@customer.send_sms_to_customer(send_sms))
      'Your message was sent'
    else
      'No message sent'
    end
  end

  def set_message_sent(value)#issue with setter method work around
    @message_sent = value
  end

  def send_txt(value)#issue with setter method work around
    @send_sms = value
  end

  private def clear_order!
    @customer_order = {}
  end

  private def sub_total(qty, item)
    qty * @menu.menu_items[item]
  end

  private def calc_total
    customer_order.inject(0) { |memo, value| memo + value[1][1]}
  end
end
require_relative 'send_text'

class Order
  DEFAULT_PROCESS_TIME = 3600
  attr_reader :order_items

  def initialize(
    order_time=nil,
    order_items=nil,
    process_time=DEFAULT_PROCESS_TIME,
    send_text_api=SendTxt.new)

    @order_time = order_time
    @order_items = order_items
    @process_time = process_time
    @send_text_api = send_text_api
  end

  def send_txt_confirm
    @send_text_api.send_txt(create_msg)
  end

  private
  def delivery_time
    @order_time + @process_time
  end

  def create_msg
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end



end

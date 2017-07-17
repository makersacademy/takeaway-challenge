require_relative 'dish_list'
require_relative 'text_sender'

class Order
  attr_reader :total, :order_data

  def initialize(**options)
    @total = 0
    @text_sender = TextSender.new(options)
  end

  def place(options)
    @list = options[:list]
    @order_data = options[:order]
    update_total
    raise "Error! Wrong total." if options[:total] != total
    send_confirmation
  end

  private

  def send_confirmation
    start_string = "Thank you!
    Your order was placed and will be delivered before "
    eta_string = "#{Time.now.hour + 1}:#{Time.now.min}"
    message = start_string + eta_string
    @text_sender.text(message)
  end

  def list_data
    @list.data
  end

  def update_total
    order_data.each { |k, v| @total += list_data[k] * v }
  end
end

require_relative 'dish_list'
require_relative 'text_sender'

class Order
  attr_reader :total, :order_data

  def initialize
    @total = 0
    @text_sender = TextSender.new
  end

  def place(options)
    @list = options[:list]
    @order_data = options[:order]
    update_total
    raise "Error! Wrong total." if options[:total] != total
    send_text
  end

  private

  def send_text
    message = "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    @text_sender.text(message)
  end

  def list_data
    @list.data
  end

  def update_total
    order_data.each { |k, v| @total += list_data[k] * v }
  end
end

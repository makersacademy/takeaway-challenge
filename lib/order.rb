require_relative 'dish_list'
require_relative 'text_sender'

class Order
  attr_reader :total, :order_data

  def initialize(**options)
    # raise "Not enough data to create an order." unless options[:order]
    @list = options[:list] || DishList.new
    @order_data = options[:order]
    @total = 0
    update_total
    @text_sender = TextSender.new
  end

  def place
    message = "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    text_sender.text(message)
  end

  private

  def list_data
    @list.data
  end

  def update_total
    order_data.each { |k, v| @total += list_data[k] * v }
  end
end

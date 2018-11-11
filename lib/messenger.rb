require_relative './price.rb'
class Messenger
  def initialize(client, order, to_from)
    @client = client
    @order = order
    @to_from = to_from
  end

  def message
    { from: @to_from[:from], to: @to_from[:to],
      body: "Hi there, your order totalling £#{Price::format(@order.total)} " +
              "will be with you at #{delivery_time}" }
  end

  def send
    @client.messages.create(message)
  end

  private
  def delivery_time
    "#{Time.new.hour + 1}:#{Time.new.min}"
  end
end

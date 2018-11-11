require_relative './price.rb'
class Messenger
  def initialize(client, order, credentials)
    @client = client
    @order = order
    @credentials = credentials
  end

  def message
    { from: @credentials[:from], to: @credentials[:to],
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

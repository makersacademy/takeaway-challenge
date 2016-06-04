require_relative 'timed_receipt'
require_relative 'text'
require 'dotenv'
Dotenv.load


class Order

  def initialize
    @total = ''
    @selected_items = []
  end

  def sum_items(user_selected_items)
    @selected_items = user_selected_items
    values = extract_values_from_items( user_selected_items )
    fail error_message if values.any? {|value| value.to_f < 0}
    @total = '%.2f' % values.map(&:to_f).reduce(0, :+)
  end

  def send_receipt
    @timed_receipt = TimedReceipt.new @selected_items, @total
    send_order_to_text
    @timed_receipt.receipt
  end

  private

  def error_message
    "Error! Sum total is incorrect!"
  end

  def extract_values_from_items(user_selected_items)
    user_selected_items.map{ |item| item.scan(/([-]*\d+.\d+)$/) }.flatten
  end

  def send_order_to_text
    text = Text.new({
      account_sid: ENV['TWILIO_ACCOUNT_SID'],
      auth_token: ENV['TWILIO_AUTH_TOKEN'],
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MY_NUMBER'],
      body: @timed_receipt.receipt
    })
    text.send_text
  end
end








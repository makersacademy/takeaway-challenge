require 'dotenv'
Dotenv.load('./twilio_credentials.env')
require 'twilio-ruby'
require_relative 'list_of_dishes'


class Order
  attr_reader :summary

  def initialize(list_of_dishes, selections, total)
    raise ArgumentError, 'order must not be empty' if selections.empty?
    read_env_variables
    populate_summary(list_of_dishes, selections)
    verify_total(total)
  end

  def send_text
    client = Twilio::REST::Client.new @account_sid, @auth_token
    
    client.messages.create(
      from: @takeaway_number,
      to: @order_number,
      body: create_message_body
    )

    'Text sent'
  end

  private

  def read_env_variables
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @order_number = ENV['ORDER_PHONE_NUMBER']
    @takeaway_number = ENV['TAKEAWAY_PHONE_NUMBER']
  end

  def populate_summary(list_of_dishes, selections)
    @summary = {}

    selections.each do |dish, quantity|
      full_dish = list_of_dishes.get_dish(dish)
      @summary[dish] = { quantity: quantity, price: full_dish.price }
    end
  end

  def verify_total(total)
    total_from_summary = 0
    @summary.each do |_, quantity_and_price|
      total_from_summary += quantity_and_price[:quantity] * quantity_and_price[:price]
    end
    total_from_summary = total_from_summary.round(2)

    raise_total_verification_error(total, total_from_summary) if total != total_from_summary
  end

  def raise_total_verification_error(total, total_from_summary)
    error_message = "incorrect order total. Total given = #{total}. Actual = #{total_from_summary}"
    raise ArgumentError, error_message
  end

  def create_message_body
    delivery_time = "#{Time.now.hour + 1}:#{Time.now.min}"
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end

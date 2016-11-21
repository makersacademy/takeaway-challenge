require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class Notification

  attr_reader :current_order, :current_order_total, :client

  def initialize(current_order, order_total, twilio_client=Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
    @current_order = current_order
    @current_order_total = order_total
    @client = client ||= twilio_client
  end

  def summarise_order
    "Thank you for your order!\nYou should receive it before #{Time.now.hour + 1}:#{Time.now.min}.\nHere's what you'll get:\n\n#{format_line_items}\nTOTAL: £#{@current_order_total}"
  end

  def send_sms
    @client.messages.create({
      :from => ENV['TWILIO_PHONE'],
      :to => ENV['TWILIO_DESTINATION_PHONE'],
      :body => self.summarise_order
    })
  end

  private


  def format_line_items
    manifest = ''
    @current_order.each { |item| manifest << "- #{item[:quantity]}x #{item[:dish].name} @ £#{item[:dish].price} \n" }
    manifest
  end

end

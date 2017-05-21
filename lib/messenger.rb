require 'twilio-ruby'

# This sends a confirmation message to a customer via SMS.
class Messenger

  def initialize
    account_sid = 'AC02744860c8f9050b6006f5311dff458d'
    auth_token = '3103e2415597fdd2fe16110b242d5ae7'
    @twilio_id = '+441792720462'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(order_number)
    delivery_time = (Time.new + 3600).strftime('%H:%M')
    message = "Thank you for your order (##{order_number}).
We're cooking it up now and it'll be with you by #{delivery_time}!"
    @client.account.messages.create({
        from: @twilio_id,
        to: '+447793198014',
        body: message })
  end

end

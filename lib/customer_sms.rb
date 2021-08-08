require 'rubygems'
require 'dotenv/load'
require 'twilio-ruby'


class OrderConfirmation
  
  time = Time.new
  order_time = time.strftime("%H:%M")
  delivery_time = (time + 25 * 60).strftime("%H:%M")

  # @from = ENV["SERVICE_SID"]
  # @to = ENV["MY_NUMBER"] 
  # @message = "Order placed at: #{order_time}\nThank you for placing an order with SandCream! Your delivery will be with you by: #{delivery_time}"
  
  @account_sid = ENV["TWILIO_ACCOUNT_SID"]
  @auth_token = ENV["TWILIO_AUTH_TOKEN"]
  @client = Twilio::REST::Client.new(@account_sid, @auth_token) 

  # def send_sms
  #   @client.messages.create( 
  #    from: @from,
  #    to: @to,
  #    body: @message
  #   ) 
  # end
  
  message = @client.messages.create( 
    body: "Order placed at: #{order_time}\nThank you for placing an order with SandCream! Your delivery will be with you by: #{delivery_time}",
    messaging_service_sid: ENV["SERVICE_SID"],      
    to: ENV["MY_NUMBER"] 
  ) 
  
end


# bundle exec ruby customer_sms.rb
  # @message = @client.messages.create( 
  #   body: "Order placed at: #{order_time}\nThank you for placing an order with SandCream! Your delivery will be with you by: #{delivery_time}",
  #   messaging_service_sid: 'MG5c11c53106acc19d7f0f0f985b174fb8',      
  #   to: ENV["MY_NUMBER"] 
  # )

  # puts message.sid
 
# puts message.sid

# sms = OrderConfirmation.new
# sms.send_sms

  # def send_sms
  #   message = @client.messages.create( 
  #     body: "Order placed at: #{order_time}\nThank you for placing an order with SandCream! Your delivery will be with you by: #{delivery_time}",
  #     messaging_service_sid: 'MG5c11c53106acc19d7f0f0f985b174fb8',      
  #     to: ENV["MY_NUMBER"] 
  #   ) 
  # end
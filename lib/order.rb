# require '/twilio-ruby'
# require './menu'
# require './order'

class Order

  attr_reader :order_info, :time_order_in, :customer_number, :from_number
   
   def initialize(order_info, phone_number)
    @order_info = order_info
    @customer_number = phone_number
    @from_number = '+441748352040'
    @time_order_in = Time.new
    account_sid = 'AC9ecff5bef6676738eeb43f6725108ca7'
    auth_token = '9845ae3dd289ebf22cba9b1a393ae050'

   end

   def estimated_arrival_time
    return arrival_time = time_order_in + (60*60)
   end

   def msg_to_be_sent
    return "Thank you for your custom.\nYou ordered #{order_info}.\nYour order will arrive by #{estimated_arrival_time}."
   end

   def send_text
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: from_number,
      to: customer_number,
      body: msg_to_be_sent
    )
   end

end



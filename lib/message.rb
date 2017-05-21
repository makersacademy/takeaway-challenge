require 'twilio-ruby'

class Message
  attr_reader :time_order

  def initialize
    @account_sid = 'ACb57d78ffceb78ec72d31808940fdd9cb'
    @auth_token = 'e12e1e03d87e789be99786c14b9c97a1'
    @twilio_number = '+441984250037'
    @customer_number = '+447490553888'
  end

  def send_message(price)
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    calculate_time
    @client.account.messages.create(
       :from => @twilio_number,
       :to => @customer_number,
       :body => "Yum, your delicious order is on its way! Total cost will be £#{price}, and arrives at #{@time_order}. Enjoy! \u{1F35D}"
    )
   end

   private
   def calculate_time
     time = Time.now;
     time2 = Time.now + (30 * 60)
     @time_order = "#{time2.hour}:#{time2.min}"
   end
end

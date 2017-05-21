class Message
  attr_reader :time
  
  def initialize
    @sid = 'ACb57d78ffceb78ec72d31808940fdd9cb'
    @auth_token = 'e25e2b8fcdb5e59077edffe283e008b0'
    @number = '+447490553888'
  end

  def send_message(price)
    twilio_information
    calculate_time

    message = @client.account.messages.create(
       :from => @twilio_number,
       :to => @number,
       :body => "Yum, your delicious order is on its way! Total cost will be £#{price}, and arrives at #{@time}."
    )
    puts message.to
   end

   private
   def twilio_information
     @twilio_number = ENV[@number]
     @client = Twilio::REST::Client.new ENV[@sid], ENV[@auth_token]
   end

   def calculate_time
      @time = "#{Time.now.hour}:#{Time.now.min + 30}"
   end
end

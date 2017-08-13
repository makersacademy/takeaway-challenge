
# in lib/sms.rb
class SMS

  def initialize(messages)
    @messages = messages
  end

  def send(phone_number, summary)
    sms = "Thank you! Your order was placed and will be delivered before #{summary[:time]}"
    out = "A confirmation has been sent to #{phone_number}"
    # @messages.create({
    #   :from => '+15017250604',
    #   :to => phone_number,
    #   :body => sms,
    # })
    puts "#{sms}\n#{out}"
  end
end

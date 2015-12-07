require 'twilio-ruby'


class SmsNotification
def order
account_sid = "REMOVED"
auth_token = "REMOVED"

delivery_time = Time.now + 3600

begin
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
        :from => 'REMOVED',
        :to => 'REMOVED',
        :body => "Thankyou for ordering through command line takeaways! Your order will be with you by #{delivery_time.hour}:#{'%02d' %delivery_time.min}."
    })
rescue Twilio::REST::RequestError => e
    puts e.message
end
end

end

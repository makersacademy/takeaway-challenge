require 'twilio-ruby'

class Texter

  time = Time.new
  dtime = time + 3600
  delivery_time = dtime.strftime("%I:%M%p")

  def send_message(message, to_number, from_number)
    client = Twilio::REST::Client.new(ENV['SID'], ENV['AUTH_TOKEN'])
    client.account.messages.create(:body => "#{message}",
        :to => "#{to_number}",
        :from => "#{from_number}")
  end
end
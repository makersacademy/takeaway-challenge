require 'twilio-ruby'

class Confirm

  attr_reader :send_text

  def send_text
    account_sid = 'AC9a9a54fc49d528d609da5294f969985a'
    auth_token = 'bc2f3a6a6ac61ac1908b52b204ca57a4'
    client = Twilio::REST::Client.new account_sid, auth_token

    client.account.messages.create(
      :from => '+441597800027', #Twilio phone number
      :to => '+447495151646',
      :body => message
      )
  end

  private

  def message
    "Thank you! Your order was placed and will be delivered before " +
    delivery_time(Time.new)
  end

  def delivery_time(current_time)
    plus_hour = current_time + 3600
    plus_hour.strftime('%H') + ":" + plus_hour.strftime('%M')
  end

end

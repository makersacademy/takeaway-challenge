require 'twilio-ruby'

class ConfirmationText

  def initialize
    @time = Time.now + 3600
  end

  def send_text
  account_sid = 'AC7c15461ad237605f09c0296a3fd454eb'
  auth_token = '780a424384398435cd5877e797c20a66'
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  message = @client.messages.create(
                             body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%k:%M")}",
                             from: '+441376350089',
                             to: '+447521693895'
                                    )
  puts message.sid
  end

end

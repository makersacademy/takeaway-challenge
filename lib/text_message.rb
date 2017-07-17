require 'twilio-ruby'

module TextMessage
  @account_sid = 'AC6a1de4a87857cab261a9d86a6b36e076'
  @auth_token = 'a9e82fdb46716c1f6886b205bcc3f92e'
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)

  def self.send(mobile_number)
    @client.api.account.messages.create({
      :from => '+441412802646',
      :to => mobile_number,
      :body => "Thank you! Your order was placed and will be delivered before #{hour_from_now}",
    })
  end

  def self.hour_from_now
    ((Time.now.hour) + 1).to_s + ":" + Time.now.min.to_s
  end

  private_class_method :hour_from_now

end

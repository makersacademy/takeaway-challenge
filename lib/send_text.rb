require("bundler")
Bundler.require()


class SendText

  def tester

    time = Time.new
    delivery_time = "#{time.hour + 1} #{time.min}"

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    mobile_number = ENV['MOB_NUMBER']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: mobile_number,
      from: "+18136051659",
      body: "You're food will delivered at #{delivery_time}"
    )
  end

end

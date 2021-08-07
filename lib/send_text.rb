require("bundler")
Bundler.require()


class SendText

  def tester

    time = Time.new
    delivery_time = "#{time.hour + 1} #{time.min}"

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: ENV['MOB_NUMBER'],
      from: "+18136051659",
      body: "You're food will delivered at #{delivery_time}"
    )
  end

end

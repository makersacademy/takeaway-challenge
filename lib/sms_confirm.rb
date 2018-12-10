require("bundler")
Bundler.require()
class SMS

  def intitializ
    account_sid = "ACa807f58093c9262c30d6551be355db48"
    auth_token = "ad862830a9ba96f9b5e3031c73eb4d94"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_confirmation
    @client.api.account.messages.create(
      to: "447561848422",
      from: "441725762059",
      body: "Order confirmed! It will arrive by #{(Time.new + 3600).strftime("%-I:%M%P")}"
    )
  end
end

require("bundler")
Bundler.require()


class SendText

  def tester(name)

    account_sid = "AC2ca5ce365f1e6d87a214fd2421755569"
    auth_token = "8d302f24ae7bc66822a48b0bdfd11ad8"

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: "+447925031543",
      from: "+18136051659",
      body: "You're food will be ready soon #{name}"
    )
  end

end

send_text = SendText.new
send_text.tester("danny")
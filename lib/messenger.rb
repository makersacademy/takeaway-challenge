require gem 'twilio-ruby'



  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    from: '+441641212024',
    to: '+',
    body: "You have ordered #{@basket}, the total of the order is £#{@total}"
    )

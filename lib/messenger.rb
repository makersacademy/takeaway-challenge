require gem 'twilio-ruby'

  account_sid = 'AC90bfd5e0185909975cd95c1c35cef796'
  auth_token = '66ba6806992ee9d677cad47d05d35199'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create(
    from: '+441641212024',
    to: '+447817333745',
    body: "You have ordered #{@basket}, the total of the order is £#{@total}"
    )

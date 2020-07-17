require 'twilio-ruby'

class Twilio_Class

  @account_sid = 'AC8570a3eadf52517a21826c22133b38b6'
  @auth_token = ENV['TWILAUTH']
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)

  @from = '+12056971553'
  @to = ENV['DPHONE'] # CHECK CHECK CHECK CHECK
  @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before 18:52"
  )
end

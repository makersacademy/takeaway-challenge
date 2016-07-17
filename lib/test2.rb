class Takeaway
  def text
    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    client.account.messages.create(
      :from => MY_TWILIO_NUMBER,
      :to => NUMBER_TO_SEND,
      :body => "Thank you! Your order was placed and will be delivered soon."
    )
    puts client.account.messages
    puts "Sent message!"
  end
end

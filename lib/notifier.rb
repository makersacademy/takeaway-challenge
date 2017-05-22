class Notifier

  require 'rubygems'
  require 'twilio-ruby'

  account_sid = "AC2b7acc11d0d6df3e0ede6667dd764d91"
  auth_token = "57840fda16dc2b8cc3f8bc3af96f3e7e"

  from = "+441925320184"
  @client = Twilio::REST::Client.new account_sid, auth_token

  # friends = {
  # "+447960083589" => "Me!",
  # }
  #
  # friends.each do |key, value|
  #   @client.account.messages.create(
  #     :from => from,
  #     :to => key,
  #     :body => "Your order is en route and will arrive at #{Time.now + 1000}. Thank you!"
  #   )
  #   puts "Sent message to #{value}"
  # end

end

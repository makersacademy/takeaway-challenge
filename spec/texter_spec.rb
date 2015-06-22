require 'texter'
require 'twilio-ruby'

describe Texter do

  let (:client) do
    Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  it 'sends a message' do
    Texter.send_message(message: "Hello")
  end

end
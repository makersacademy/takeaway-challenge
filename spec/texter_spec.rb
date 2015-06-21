require 'texter'
require 'twilio-ruby'

describe Texter do

let(:client) do
  Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
end

let(:dave) { double :person, number: '441772368127' }
let(:mobile) {double :person, number: '447552768118', name: 'david'}

it 'sends a message' do
  Texter.call(message: "Hello", from: dave, to: mobile, via: client)
end

end
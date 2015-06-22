require 'text_order'
require 'twilio-ruby'

describe TextOrder do

  let(:dud_message) { double :dud_message }
  let (:client) { double :client, messages: dud_message }
  	# {Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']}

  let (:twilio_person) { double :person, number: ENV['twilio_number'] }
  let (:person) { double :person, number: ENV['mobile'], name: 'Me' }

  it 'sends a text message' do
    expect(dud_message).to receive :create
    TextOrder.call(message: "Testing", from: twilio_person, to: person, via: client)
  end

end

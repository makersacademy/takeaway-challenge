require_relative '../lib/twilio_api.rb'

class Dummy
  include Messenger
end

describe Dummy do

  it "can send out messages" do
    client = double(:client)
    expect(Twilio::REST::Client).to receive(:new).with(
      ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"])
    expect(nil).to receive_message_chain(
      :account,:sms,:messages,:create)
    subject.sendMessage("test",0)
  end

end


# it 'connects with TwilioAPI' do
#       client = double(:client)
#       allow(client).to receive_message_chain(:messages, :create)
#       expect(Twilio::REST::Client).to receive(:new).and_return(client)
#       subject.send_sms(10)
#     end
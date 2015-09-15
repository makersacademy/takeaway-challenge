require 'text'
require '../.env.rb'
require 'twilio-ruby'

describe Text do
  it { is_expected.to respond_to :time }

  it { is_expected.to respond_to :send_text}

  it 'should send text when order is placed' do
   client = double :client
   allow(client).to receive_message_chain(:messages, :create)
   expect(Twilio::REST::Client).to receive(:new).and_return(client)
   subject.send_text
  end

end

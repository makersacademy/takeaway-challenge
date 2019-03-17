# 73.33% coverage on tests 
# but not sure how to increase this as a lot of the working is from the Twilio gem

require 'message'

describe Message do
  let(:account_sid) { double :account_sid }
  let(:auth_token) { double :auth_token }
  let(:twilio_number) { double :twilio_number }
  let(:customer_number) { double :customer_number }
  let(:messsid) { double :message_sid }
  let(:client) { double :client }

  subject { described_class.new(account_sid, auth_token, twilio_number) }

  it { is_expected.to respond_to :send }

  it 'sends a message to the user' do
    allow(client).to receive_message_chain(:messages, :create)
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(subject).to receive(:send).with(customer_number)
    subject.send(customer_number)
  end

end

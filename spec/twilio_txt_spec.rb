require "twilio_txt"

describe Sms do

  let!(:client) { double(:client) }
  let(:subject) { Sms.new(client) }
  let(:chain)   { "account.messages.create" }

  before(:each) do
    allow(client).to receive_message_chain(chain) { "output message" }
  end

  it "returns a message when called" do
    expect(subject.call).to eq "output message"
  end

  it 'defaults to a predefined number' do
    subject.call
    expect(subject.num).to eq "+447479365828"
  end
end

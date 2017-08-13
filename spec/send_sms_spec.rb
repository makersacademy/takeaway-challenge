require 'send_sms'

describe Texter do
  it 'works' do
    expect(subject.class).to eq described_class
  end

  context '#send_text' do
    it 'sends a text with a message' do
      expect($client).to receive_message_chain(:messages, :create)
      subject.send_text("Hello!")
    end
  end
end
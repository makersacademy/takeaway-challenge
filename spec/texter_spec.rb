require 'texter'

describe Texter do
  it { is_expected.to be_instance_of(Texter)}

  describe '#send_message' do
    it 'sends a text message' do
      expect_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages, :create)
      subject.send_message(123456)
    end
  end
end

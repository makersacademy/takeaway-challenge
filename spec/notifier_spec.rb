require 'notifier'

describe Notifier do
  let(:now) {Time.new(2015, 10, 25, 0, 0, 0, "+00:00") }
  let(:messages) {double :messages}
  let(:fake_client) {double :client, messages: messages }
  let(:config_loader) do
    double :config_loader,
      account_sid: "BLAHBLAHBLAH",
      auth_token: "BLAHBLAHBLAH"
  end
  let(:config_loader_klass) {double :config_loader_klass, new: config_loader}
  subject(:notifier) do
    described_class.new(config_loader_klass: config_loader_klass)
  end

  context 'Notifications' do
    it {is_expected.to respond_to(:notify).with(1).argument}

    it 'notifies the customer with a suitable message' do
      allow(messages).to receive(:create).with(anything).and_return(anything)
      allow(Time).to receive(:now).and_return now
      allow(Twilio::REST::Client).to receive(:new).and_return fake_client
      expect(notifier.notify(Time.now)).to eq(
        "Thank you! Your order was placed and will be delivered before 00:00")
    end
  end
end

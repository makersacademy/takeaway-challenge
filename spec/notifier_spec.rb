require 'notifier'

describe Notifier do
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
  end
end

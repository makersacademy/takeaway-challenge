require 'REST'

describe SMS do
  describe '#send_sms' do
    it {is_expected.to respond_to(:send_sms).with(1).argument}

  end
end

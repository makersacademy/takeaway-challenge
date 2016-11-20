require 'sms'

describe Sms do
    subject(:sms) { described_class.new }

    it 'should test that an sms is sent' do
      expect(sms).to receive(:send_message).with("Thank you, your order is on its way")
      sms.send_message("Thank you, your order is on its way")
    end
end

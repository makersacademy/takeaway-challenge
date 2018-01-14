require 'sms'

describe SMS do

  context '#deliver' do
    subject(:sms) { described_class.new }

    it "Should send text message to client" do
      expect(sms).to receive(:deliver)
      sms.deliver
    end
  end
end

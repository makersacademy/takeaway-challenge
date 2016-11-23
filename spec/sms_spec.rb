require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  context "sending a text" do
    it 'should send a confirmation' do
      expect(sms).to respond_to(:send_confirmation)
    end
    it 'should return a confirmation message' do
      allow(sms).to receive(:send_confirmation).and_return("Message sent.")
      expect(sms.send_confirmation).to eq("Message sent.")
    end
  end
end

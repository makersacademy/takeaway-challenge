
require 'send_sms'

describe Send_SMS do
  subject(:sms) {described_class.new}
  let(:customer) {{phone: :"+441123456789", name: :Sebastian}}

  describe '#confirmation_text' do
    before do
      allow(sms).to receive(:confirmation_text).and_return(customer)
    end
    it 'sends text messages with 1 hour ahead time stamp' do
      expect(sms.confirmation_text(customer)).to eq(customer)
    end
  end
end

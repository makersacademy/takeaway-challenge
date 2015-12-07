require 'send_text'

describe SendText do
  subject(:sms) {described_class.new}
  let(:customer) {{"+44712345" => :Chris}}

  describe '#confirmation_text' do
    before do
      allow(sms).to receive(:confirmation_text).and_return(customer)
    end
    it 'sends a text message for order confirmation with delivery time' do
      expect(sms.confirmation_text).to eq(customer)
    end
  end


end

require 'twilio_client'

describe TwilioClient do
  describe '#send_order_confirmation' do
    let(:messages) { double :messages }
    let(:object) { double :object }
    let(:create) { double :create }

    it 'sends a confirmation text to customer' do
      allow(subject.client).to receive(:messages) { object }
      allow(object).to receive(:create) { 'Thank you for your order' }
      expect(subject.send_order_confirmation('Malachi', ENV['MOBILE_NUMBER'])).to eq('Thank you for your order')
    end
  end
end
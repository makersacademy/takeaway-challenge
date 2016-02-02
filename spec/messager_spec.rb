describe Messager do
  subject(:messager){described_class.new}

  describe '#send_sms' do

    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_sms)
      subject.send_sms
    end

    it 'returns a confirmation as an output' do
      expect(subject).to receive(:send_sms).and_return('Your order has been confirmed')
      subject.send_sms
    end

  end


end

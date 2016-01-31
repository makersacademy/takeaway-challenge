describe Messager do
  subject(:messager){described_class.new}

  describe '#initialize' do

    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_sms)
      subject.send_sms
    end

  end


end

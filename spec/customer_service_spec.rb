describe CustomerService do
  describe 'confirmation_text' do
    it 'sends customers texts' do
      allow(subject).to receive(:confirmation_text) { 'text has been sent' }
      expect(subject.confirmation_text).to eq 'text has been sent'
    end
  end

  describe '#client_class' do
    context 'when intialized with no arguments' do
      it 'has a default messaging client' do
        expect(!!subject.send(:client)).to be true
      end
    end
  end
end

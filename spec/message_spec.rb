describe Message, :message do
  subject { described_class.new('Test message') }

  describe '#initialize' do
    it 'initializes with a from number' do
      expect(subject.from).to eq '+447533006429'
    end

    it 'initializes with a to number' do
      expect(subject.to).to eq '+447533105683'
    end

    it 'initializes with a message' do
      expect(subject.message).to eq 'Test message'
    end
  end
end

describe Message do
  describe '#send' do
    it 'returns the message received as an argument' do
      expect(subject).to receive(:send).with("Hi there")
      subject.send("Hi there")
    end
  end
end

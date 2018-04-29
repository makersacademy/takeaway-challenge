describe Message, :message do
  subject { described_class.new('Test message') }

  describe '#initialize' do
    it 'initializes with a from number' do
      expect(subject.from).to eq ENV['TWILIO_PHONE']
    end

    it 'initializes with a to number' do
      expect(subject.to).to eq ENV['TWILIO_DESTINATION_PHONE']
    end

    it 'initializes with a message' do
      expect(subject.message).to eq 'Test message'
    end
  end

  describe '#send' do
    it 'sends a text message when the order is placed' do
      VCR.use_cassette('twilio-message') do
        subject.send
      end
    end
  end
end

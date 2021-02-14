describe CustomerService do
  let(:twilio)   { class_double(Twilio, :twilio) }
  let(:client)   { double(:client, messages: messages ) }
  let(:messages) { double(:messages, create: 'text has been sent') }
  subject        { described_class.new(twilio) }

  describe 'confirmation_text' do
    it 'sends customers texts' do
      allow(subject).to receive(:create_client) { client }
      expect(subject.confirmation_text).to eq 'text has been sent'
    end
  end

  describe '#delivery_time' do
    let(:time) { Time.new }
    it 'converts Time.now to HH:MM + 1 hr' do
      expect(subject.send(:delivery_time)).to eq (time + 3600).strftime('%H:%M')
    end
  end
end

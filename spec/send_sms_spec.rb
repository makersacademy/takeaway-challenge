require './lib/send_sms'
describe SendSms do
  let(:send_message) { double :send_message }
  let(:time) { Time.new + 60 * 60 }
  let(:delivery_time) { time.strftime("%H:%M") }
  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }
  end
  describe '#delivery_time' do
    it 'returnes the delivery time' do
      expect(subject.delivery_time).to eq(delivery_time)
    end
  end
end

require 'text'

describe Text do
  let(:twilio_client) { double(:client, messages: 'message') }
  subject { described_class.new(twilio_client) }

  describe '#send_delivery_expected' do
    let(:order_time) { Time.now }
    let(:delivery_time) { order_time + 3600 - order_time.sec }
    let(:delivery_time_string) { delivery_time.strftime("%k:%M") }
    let(:hash_contents) { hash_including(body: include(delivery_time_string), to: instance_of(String), from: instance_of(String)) }

    it 'calls messages.create on the twilio client with delivery time' do
      expect(twilio_client.messages).to receive(:create).with(hash_contents)
      subject.send_delivery_expected(order_time)
    end
  end

end

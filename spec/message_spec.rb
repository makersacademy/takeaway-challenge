require 'message'

describe Message do

  let(:time) { Time.new(2007,11,19,21,37,48,"-06:00") }
  let(:subject) { described_class.new(time) }

  describe "#confirmation_message" do
    it 'returns order confirmationmessage' do
      expect(subject.confirmation_message).to eq("Thank you! Your order was placed and will be delivered before 22:37")
    end
  end

  describe '#time_one_hour_ahead' do
    it 'returns the time +1 hour' do
      expect(subject.time_one_hour_ahead).to eq('22:37')
    end
  end
end

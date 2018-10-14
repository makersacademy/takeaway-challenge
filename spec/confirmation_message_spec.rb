require 'confirmation_message'

describe ConfirmationMessage do
  let(:delivery_time) { '16:23' }
  let(:mock_plus_one) { double :mock_plus_one, strftime: delivery_time }
  let(:mock_time) { double :mock_time, :+ => mock_plus_one }
  subject { described_class.new(delivery_time) }

  describe '#text' do
    it 'creates a confirmation message with time' do
      expect(subject.text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end
  end

  context 'no delivery time given' do
    subject { described_class.new }

    it 'initialize with current time + 1 hour' do
      allow(Time).to receive(:new).and_return(mock_time)
      expect(subject.text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end
  end

end

require 'order'

describe Order do
  let(:menu) { double :menu }
  subject { described_class.new(menu) }
  before(:each) { allow(menu).to receive(:dishes) { { salmon: 2, egg: 1.5 } } }

  describe '#add' do
    it 'allows the customer to place an order' do
      subject.add(:salmon, 2)
      subject.add(:egg, 3)
      expect(subject.ordered_dishes).to eq(salmon: 2, egg: 3)
    end

    it 'raises an error when wrong food is ordered' do
      expect { subject.add(:cake, 2) }.to raise_error 'Not on the menu!'
    end

    it 'reports back the number of dishes ordered' do
      subject.add(:salmon, 2)
      expected_message = 'So far, you have ordered 2 salmon and 3 egg sushi(s).'
      expect(subject.add(:egg, 3)).to eq expected_message
    end
  end

  describe '#total' do
    it 'shows the total' do
      subject.add(:salmon, 2)
      subject.add(:egg, 3)
      expect(subject.total).to eq 'The total amount is £8.5.'
    end
  end

  describe '#checkout' do
    it 'returns error when the number is not equal to the input' do
      subject.add(:salmon, 2)
      subject.add(:egg, 3)
      expect(subject.checkout(1)).to eq 'That is not the correct amount.'
    end

    let(:mock_api) { double :api }
    before(:each) { allow(subject).to receive(:text_provider) { mock_api } }
    it 'sends a text when payment is confirmed' do
      subject.add(:salmon, 2)
      subject.add(:egg, 3)
      expect(mock_api).to receive(:text_message).with(8.5)
      subject.checkout(8.5)
    end

    it 'returns confirmation when payment is confirmed' do
      subject.add(:salmon, 2)
      subject.add(:egg, 3)
      allow(mock_api).to receive(:text_message)
      expected_message = 'Thank you for your order, a text message will be sent to you shortly.'
      expect(subject.checkout(8.5)).to eq expected_message
    end
  end
end

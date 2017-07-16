require 'order'

describe Order do
  let(:subject) { described_class.new }

  describe '#add' do
    let(:dish) { double :dish }
    let(:quantity) { 1 }

    it { is_expected.to respond_to(:add).with(2).argument }

    it 'adds an item(s) to basket' do
      items = Hash.new(0)
      items[dish] += 1
      subject.add(dish, quantity)
      expect(subject.display_basket).to eq items
    end
  end
end

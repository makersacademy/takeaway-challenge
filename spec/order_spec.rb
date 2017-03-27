require 'order'

describe Order do

  subject(:order){ described_class.new(menu) }
  let(:menu) {instance_double("Menu")}
  let(:menu_list) do {rolls: 5, curry: 8} end

  describe '#initialization' do

    it 'basket is empty upon initialization' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add' do

    it 'adds items to the basket' do
      order.add(:rolls, 1)
      order.add(:rolls, 3)
      basket = {rolls: 4}
      expect(order.basket).to eq basket
    end

  end

  describe '#total' do

    it 'returns the total cost of the order' do
      allow(menu).to receive(:price).with(:rolls).and_return(5)
      allow(menu).to receive(:price).with(:curry).and_return(8)
      order.add(:rolls, 5)
      order.add(:curry, 1)
      expect(order.total).to eq 33
    end
  end

end

require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'responds to select_dish method with two arguments' do
    expect(order).to respond_to(:select_dish).with(2).arguments
  end

  it 'initializes with an empty array as a basket' do
    expect(order.basket).to be_a_kind_of(Array)
  end

  describe '#select_dish' do
    it 'lets you add some number of available dishes to the basket' do
      expect { order.select_dish('bolognese', 2) }.to change { order.basket.count }.by(2)
    end

    it 'has a default quantity of one' do
      expect { order.select_dish('puttanesca') }.to change { order.basket.count }.by(1)
    end
  end

  describe '#calculate_total' do
    it 'adds up the total of the items in the basket' do
      order.select_dish('puttanesca', 2)
      order.select_dish('bolognese')
      expect(order.calculate_total).to eq(18.50)
    end
  end
end

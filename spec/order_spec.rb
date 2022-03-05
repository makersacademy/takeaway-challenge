require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:menu_double, 'bolognese' => 7.50, 'arrabiata' => 4.50) }

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
  end
end

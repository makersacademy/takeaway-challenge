require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'initializes with an empty hash as a basket' do
    expect(order.basket).to be_a_kind_of(Hash)
  end

  describe '#select_dish' do
    it 'lets you add some number of available dishes to the basket' do
      expect { order.select_dish('bolognese') }.to change { order.basket.length }.by(1)
    end

    it 'has a default quantity of one' do
      expect { order.select_dish('puttanesca') }.to change { order.basket.length }.by(1)
    end

    it 'raises an error if the menu does not contain dish' do
      expect { order.select_dish('pizza') }.to raise_error Order::NOT_ON_MENU_ERROR
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from the basket' do
      order.select_dish('bolognese')
      expect { order.remove_dish('bolognese') }.to change { order.basket }.from({ 'bolognese' => 7.5 }).to({ 'bolognese' => 0 })
    end
  end

  describe '#checkout' do
    it 'shows you your bill and total' do
      order.select_dish('carbonara')
      expect { order.checkout }.to output("carbonara: 6.5\n*************\nYour total is 6.5\n").to_stdout
    end
  end
end

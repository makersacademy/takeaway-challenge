require 'order'

describe Order do

  let(:menu) { double :menu, read_menu: { "Lassi" => 3.00 }, price_of_dish: 3.00 }
  subject(:order) { described_class.new(menu) }

  describe '#cust_order' do
    it 'raises error if a dish is not in the menu' do
      error = "Sorry! that dish is not in the menu"
      expect { order.cust_order("aan") }.to raise_error error
    end

    it 'prints ordered dishes with prices' do
      expect(order.cust_order("Lassi", 2)).to eq "Lassi * 2 added to basket"
    end

    it 'prints the total' do
      order.cust_order("Lassi", 2)
      expect(order.total).to eq 6.0
    end
  end

  describe '#basket' do
    it 'prints dishes with prices in the basket' do
      order.cust_order("Lassi", 2)
      expect(order.basket).to eq "Lassi * 2 = 6.0"
    end
  end

  describe '#add' do
    it 'checks if dish is added to the order' do
      order.cust_order("Lassi", 1)
      order.add("Lassi", 1)
      expect(order.basket).to eq "Lassi * 2 = 6.0"
    end
  end
end

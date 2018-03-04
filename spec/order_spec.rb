require 'order'

describe Order do
  let(:menu) { double :menu, read_menu: { "Naan" => 1.00 }, price_of_dish: 1.00 }
  subject(:order) { described_class.new(menu) }
  describe '#customer_order' do
    it 'raises error if dish is not in the menu' do
      error = "Sorry! dish not in the menu"
      expect { order.customer_order("Malwa") }.to raise_error error
    end

    it 'prints ordered dishes with prices' do
      expect(order.customer_order("Naan", 2)).to eq "Naan * 2 added to basket"
    end
  end

  describe "#basket" do
    it 'prints dishes with prices in the basket' do
      order.customer_order("Naan", 2)
      expect(order.basket).to eq "Naan * 2 = 2.0"
    end
  end
end

require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:textprovider) { double :textprovider }
  let(:client) { double :client }

  context 'by default' do
    it 'nothing is in the basket' do
      expect(order.total_bill).to eq(0)
    end
  end

  context 'ordering' do
    before do
      allow(menu).to receive(:dishes).and_return(1 => { dish: "Egg fried rice", price: 3 })
    end

    describe '#select_dish' do
      it 'stores dish and total in basket' do
        expect(order.select_dish(1, 2)).to eq({ quantity: 2, subtotal: 6 })
      end
    end

    describe '#basket_summary' do
      it 'displays basket' do
        order.select_dish(1, 2)
        expect(order.basket_summary).to eq({ "Egg fried rice" => { :quantity => 2, :subtotal => 6 } })
      end
    end

    describe '#total_bill' do
      it 'sums totals in basket' do
        order.select_dish(1, 2)
        expect(order.total_bill).to eq 6
      end
    end

    describe '#checkout' do
      it 'raises error if passed incorrect amount' do
        order.select_dish(1, 2)
        expect { order.checkout(5, textprovider) }.to raise_error "Amount not correct"
      end

      it 'can send a text confirming order placed' do
        order.select_dish(1, 2)
        expect(textprovider).to receive(:send_text)
        order.checkout(6, textprovider)
      end
    end
  end
end

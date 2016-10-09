require 'order'

  describe Order do

    subject(:order) { described_class.new(menu) }
    let(:menu) { double :menu, valid_item: item, price: 10 }
    let(:item) { double :item }

      it 'lets a user see the menu' do
        expect(order.show_menu).to eq menu
      end

      describe '#add_to_basket' do

        it 'adds and item to the basket' do
          order.add_to_basket(item, 2)
          expect(order.basket).to include item
        end
      end

      describe '#calculate_total' do
        it 'returns zero with an empty basket' do
          expect(order.calculate_total).to eq 0
        end

        it 'returns total sum of all items in basket' do
          order.add_to_basket(item, 2)
          expect(order.calculate_total).to eq 20
        end
      end
      
  end

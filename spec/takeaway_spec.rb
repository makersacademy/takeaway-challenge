require './lib/takeaway'
require './lib/order'
require './lib/menu'

describe Takeaway do
  let(:menu) {double(:menu, menu_items: menu_items)  }
  let(:menu_items) { { 'Burger' => 1,
  'chips' => 2,
  'chicken' => 3,
  'drink' => 1
    } }
  let(:order) { Order.new }


    describe '#print_menu'do
    it 'prints menu items' do
      expect(subject.print_menu).to eq (menu_items)
    end
  end

   describe '#add_to_basket' do
     it 'allows customer to select items from menu and add to basket/order' do
     expect(subject.add_to_basket('item', 2)).to eq(order.add_items('item',2))
     end
   end

   describe '#order_summary' do
     it 'displays customer order summary' do
     expect(subject.order_summary).to eq(order.basket_contents)
     end
   describe '#order_total' do
     it 'displays #basket_total' do
       expect(subject.order_total).to eq(order.basket_total)
     end
   end
 end
end

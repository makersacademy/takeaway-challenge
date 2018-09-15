require 'order'

describe Order do
  let(:order) { described_class.new(menu) }
  let(:menu) { double('menulist', get_menu: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }] ) }

  context '#show_menu' do
    it 'formats menu in a people-friendly way' do
      expect{order.show_menu}.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end
  context '#add' do
    it 'adds a new order to the orderlist' do
      order.add(0)
      expect(order.orderlist).to include ({ order_num: 4, name: "Cold Potatoes", price: 1.00 })
    end
  end

  context '#complete_order' do
    it 'for now should just show what the list contains' do
      expect(order.complete_order).to eq order.orderlist
    end
  end
end

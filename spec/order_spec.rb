require 'order'

describe Order do
  let(:order) { described_class.new(menu, orderlist) }
  let(:menu)  { double('menulist', get_menu: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }] ) }
  let(:orderlist) { double('orderlist', show_orders: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }] ) }

  context '#show_menu' do
    it 'formats menu in a people-friendly way' do
      expect{order.show_menu}.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end
  context '#add' do
    it 'adds a new order to the orderlist' do
      expect(orderlist.show_orders).to eq [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }]
    end
  end

  context '#show_order' do
    it 'show current orders' do
      expect{order.show_menu}.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end
end

require 'order'

describe Order do
  let(:delivery) { double('delivery', place_order: "Thank you for your order") }
  let(:order) { described_class.new(menu, orderlist, delivery) }
  let(:menu)  { double('menulist', list_menu: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }]) }
  let(:orderlist) { double('orderlist',
    show_orders: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }],
    orders: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }]
     )
  }  

  context '#show_menu' do
    it 'formats menu in a people-friendly way' do
      expect { order.show_menu }.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end
  context '#add' do
    it 'adds a new order to the orderlist' do
      expect(orderlist.orders).to eq [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }]
    end
  end

  context '#show_orders' do
    it 'show current orders' do
      expect { order.show_orders }.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end

  context '#place_order' do
    it 'should send a message to customer to confirm order' do
      expect(delivery.place_order).to eq "Thank you for your order"
    end
  end
end

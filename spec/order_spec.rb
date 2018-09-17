require 'order'

describe Order do
  let(:delivery) { double('delivery', send_sms: "Thank you for your order") }
  let(:order) { described_class.new(menu, orderlist, delivery) }
  let(:menu)  { double('menulist', list_menu: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }]) }
  let(:orderlist) { double('orderlist',
    orders: [{ order_num: 4, name: "Cold Potatoes", price: 1.00 }],
    stringify_cost: "£3.00"
     )
  }

  context '#show_menu' do
    it 'formats menu in a people-friendly way' do
      expect { order.show_menu }.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end
  context '#add' do
    it 'adds a new order to the orderlist' do
      expect(order).to receive(:add).with("Store order")
      order.add("Store order")
    end
  end

  context '#show_orders' do
    it 'show current orders' do
      expect { order.show_orders }.to output("4. Cold Potatoes, price: £1.00\n").to_stdout
    end
  end

  context '#place_order' do
    it 'should send a message to customer to confirm order' do
      expect(order.place_order).to eq "Thank you for your order"
    end
  end

  context '#show_cost' do
    it 'should return a string value of the price so far' do
      expect(order.show_cost).to eq "£3.00"
    end
  end

  context 'error cases of methods attemped on no orders' do
    before(:each) do
      allow(orderlist).to receive(:orders) {[]}
    end

    it '#place_order' do

      expect{order.place_order}.to raise_error("No orders yet!")
    end

    it '#show_orders' do

      expect{order.show_orders}.to raise_error("No orders yet!")
    end

    it '#show_cost' do

      expect{order.show_cost}.to raise_error("No orders yet!")
    end

  end
end

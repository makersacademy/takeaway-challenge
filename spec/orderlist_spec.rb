require 'orderlist'

describe OrderList do
  let(:orderlist) { described_class.new }

  before(:each) do
    orderlist.store_order("Fake order")
  end

  context '#show_orders' do
    it 'shows the current order list' do
      orderlist.store_order("Fake order2")

      expect(orderlist.show_orders).to eq ["Fake order", "Fake order2"]
    end
  end

  context '#store_order' do
    it 'adds a new order to the list' do

      expect(orderlist.orders).to include "Fake order"
    end
  end

end

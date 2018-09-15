require 'orderlist'

describe OrderList do
  let(:orderlist) { described_class.new }
  randomorder = { order_num: 1, name: "Pot Noodle", price: 1.00 }

  before(:each) do
    orderlist.store_order({ order_num: 1, name: "Pot Noodle", price: 1.00 })
  end

  context '#show_orders' do
    it 'shows the current order list' do

      expect(orderlist.show_orders).to eq [{ order_num: 1, name: "Pot Noodle", price: 1.00 }]
    end
  end

  context '#store_order' do
    it 'adds a new order to the list' do

      expect(orderlist.orders).to include randomorder
    end
  end

  context '#calculate_total' do
    it 'expects a total to be given for all items currently in list' do
      orderlist.store_order( { order_num: 2, name: "Cheese Toastie", price: 2.00 })
      expect(orderlist.stringify_cost).to eq "£3.00"
    end
  end

end

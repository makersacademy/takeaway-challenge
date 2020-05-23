require 'order'

describe Order do
  subject(:order) { Order.new }

  it 'has a selection' do
    expect(order.selection).to be_an_instance_of(Hash)
  end

  describe 'add_selection(dish, quantity, price)' do
    let(:add_order) {order.add_selection("Large Fish Supper",2,7.90)}

    it 'adds the dish and quantity to the selection' do
      expect { add_order }
        .to change { order.selection }.to({"Large Fish Supper" => 2})
    end

    it 'adds the price of the dishes to the total' do
      expect { add_order }.to change { order.total }.by(15.8)
    end
  end
end

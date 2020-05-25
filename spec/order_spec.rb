require 'order'

describe Order do
  subject(:order) { Order.new }
  let(:add_order) { order.add_selection("Large Fish Supper", 2, 7.90) }

  describe 'add_selection(dish, quantity, price)' do

    it 'adds the dish and quantity to the selection' do
      expect { add_order }
        .to change { order.selection }.to({ "Large Fish Supper" => 2 })
    end

    it 'adds the price of the dishes to the total' do
      expect { add_order }.to change { order.total }.by(15.80)
    end
  end
end

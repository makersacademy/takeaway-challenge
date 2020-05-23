require 'order'

describe Order do
  subject(:order) { Order.new }
  let(:add_order) {order.add_selection("Large Fish Supper",2,7.90)}

  it 'has a selection' do
    expect(order.selection).to be_an_instance_of(Hash)
  end

  describe 'add_selection(dish, quantity, price)' do

    it 'adds the dish and quantity to the selection' do
      expect { add_order }
        .to change { order.selection }.to({"Large Fish Supper" => 2})
    end

    it 'adds the price of the dishes to the total' do
      expect { add_order }.to change { order.total }.by(15.80)
    end
  end

  describe '#format_order' do
    it 'formats the order' do
      add_order
      expect(order.format_order).to eq(["Large Fish Supper x2"])
    end
  end

  describe '#format_total' do
    it 'formats the total' do
      add_order
      expect(order.format_total).to eq("Total: 15.8")
    end
  end
end

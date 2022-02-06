require 'order'

describe Order do{}
#   let(:dish) {double "1. noodles, 9"}
#   let(:dish_add) { double "noodles" }
#   let(:price_add) { double 9 }
#   let(:quantity) { double 2 }
#   let(:order_double) { double Order.new(:dish, :quantity) }
  let(:dishes) {double :dishes}
  describe '#add_to_order' do
    it 'should add dishes and quantities to order' do
      test_order = {:dish_1 => "noodles", :price_1 => 9, :quantity_1 => 2}
      order = Order.new(["1. noodles,9, 2"])
      expect(order.combined_order).to eq(test_order)
    end
  end 

  describe '#calculate_total' do
    it 'should calculate the total value of the order' do
      order = Order.new(:dishes)
      expect { order.calculate_order(9,2) }.to change { order.order_total }.to(18)
    end
  end
end

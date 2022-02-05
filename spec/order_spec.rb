require 'order'

describe Order do{}
#   let(:dish) {double "1. noodles, 9"}
#   let(:dish_add) { double "noodles" }
#   let(:price_add) { double 9 }
#   let(:quantity) { double 2 }
#   let(:order_double) { double Order.new(:dish, :quantity) }

  describe '#add_to_order' do
    it 'should add dishes and quantities to order' do
      order = Order.new("1. noodles,9", 2)
      test_order = {:dish_1 => "noodles", :price_1 => 9, :quantity_1 => 2}
      expect { order.add_to_order }.to change { order.combined_order }.to(test_order)
    end
  end 
end

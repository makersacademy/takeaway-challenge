require 'order'

describe Order do
  let(:dish1) { double "noodles" }
  describe '#add_to_order' do
    it 'should add dishes and quantities to order' do
      order = Order.new(dish1, 2)
      test_order = {:dish_1 => "noodles", :price_1 => 9, :quantity => 2}
      expect { order.add_to_order }.to change { combined_order }.to{ test_order }
    end
  end 
end
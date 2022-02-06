require 'order'

describe Order do{}
  let(:dishes) {double :dishes}

  describe '#add_to_order' do #also tests clean order private method
    it 'should add dishes and quantities to order' do
      test_order = {:dish_1 => "noodles", :price_1 => 9, :quantity_1 => 2}
      order = Order.new(["1. noodles,9, 2"])
      order.add_to_order
      expect(order.combined_order).to eq(test_order)
    end
  end 

  describe '#calculate_order' do
    it 'should calculate the total value of the order' do
      order = Order.new(:dishes)
      expect { order.calculate_order(9,2) }.to change { order.order_total }.to(18)
    end
  end

  describe '#verify order' do
    it 'should allow the user to verify the order' do
      order = Order.new(:dishes)
      allow(order).to receive(:gets).and_return("1\n")
      order.verify_order
      expect(order.order_confirmed).to be_truthy
    end

    it 'should allow the user to cancel the order' do
      order = Order.new(:dishes)
      allow(order).to receive(:gets).and_return("2\n")
      order.verify_order
      expect(order.order_confirmed).to be_falsey
    end

  end
end

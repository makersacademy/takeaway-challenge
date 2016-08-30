require 'order'

describe Order do

subject(:order) {described_class.new}
let (:menu) {double(:menu)}

  describe '#add' do

    context 'item is available' do
      it 'add the order' do
        expect{order.add("Burger", 2)}.to change {order.current_order}.by [["Burger", 2]]
      end
    end

    context 'item is unavailable' do
      it 'cannot add order' do
       message = "Chicken is not available!"
       expect{order.add("Chicken", 2)}.to raise_error message
      end
    end

  end
end
require 'order'

describe Order do

subject(:order) {described_class.new}

  describe '#add' do

    context 'item is available' do
      it 'add the order' do
        expect{order.add("Burger", 2)}.to change {subject.current_order}.by [["Burger", 2]]
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
require 'takeaway'
require 'menu'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:fake_dish) {double:dish}

  describe '#add_order' do
    it {is_expected.to respond_to(:add_order)}

    context 'if adding items' do
      it 'should add the dish and amount to the order array' do
        expect{takeaway.add_order("pizza", 2).to change(takeaway :order)}
      end

      it 'should return an error if the item is not on the menu' do
      message = "Item not available from menu, please select another"
      expect{takeaway.add_order(fake_dish, 3)}.to raise_error message
      end
      end
    end
end

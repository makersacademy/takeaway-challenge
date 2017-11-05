require 'basket'
require 'menu'

describe Basket do
  context 'Adding new items to the basket' do
    describe '#add_item' do
      it "Should add a new item to the user's basket" do
        subject.add(1)
        expect(subject.current_order).to eq([{:dish=>"Pizza Rossa", :price=>"9"}])
      end
    end
  end

  context 'Printing the total cost of the current order' do
    describe '#total' do
      it "Should print the total cost of items in @current_order" do
        subject.add(1)
        subject.add(7)
        expect(subject.total).to eq 23.5
      end
    end
  end
end

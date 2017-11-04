require 'basket'

describe Basket do
  context 'Adding new items to the basket' do
    describe '#add_item' do
      it "Should add a new item to the user's basket" do
        subject.add(1)
        expect(subject.current_order).to eq([{:dish=>"Pizza Rossa", :price=>"9"}])
      end
    end
  end
end

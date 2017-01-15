require 'takeaway'

describe Takeaway do

  context 'Menu' do
  let(:takeaway) { described_class.new }

    it 'Should be able to call #read_menu method from Menu' do
      expect(takeaway.read_menu).to respond_to(:read_menu)
    end
    it 'Should be able add items from menu to basket' do
      expect{takeaway.order("Pizza")}.to change{takeaway.basket.size}.by(1)
    end
    it 'Should raise an error if item not on menu' do
      expect{takeaway.order("test")}.to raise_error "Item not available"
    end
  end

  context 'Order' do
  let(:takeaway) { described_class.new }

    describe '#total' do
      it 'Should return a total price in pounds sterling' do
        takeaway.order("Chips")
        expect(takeaway.total).to eq "Total: £2.50"
      end
    end
    describe '#basket_summary' do
      it 'Should return a message if no items in basket' do
        expect(takeaway.basket_summary).to eq "No items added"
      end
      it 'Should return a list if items previously added' do
        takeaway.order "Chips"
        expect(takeaway.basket_summary).to eq [{"CHIPS"=>250}]
      end
    end
  end

end

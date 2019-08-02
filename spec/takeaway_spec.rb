require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  describe '#menu' do
    it 'exists' do
      expect(takeaway.menu).to be_a(Hash)
    end
  end

  describe '#select' do
    it 'is a method for takeaway' do
      expect(takeaway).to respond_to(:select)
    end

    it 'stores items in current_order' do
      takeaway.select("bread")
      expect(takeaway.current_order).to eq({bread: 1, apples: 0})
    end
  end

  describe '#print_current_order' do
    it 'prints a list of items from current order' do
      takeaway.select("bread")
      expect(takeaway.print_current_order).to eq "bread: 1"
    end
  end

  describe '#complete_order' do
    context 'entering the correct price' do
      it 'confirms the order' do
        takeaway.select("bread")
        expect(takeaway.complete_order(5)).to eq 'Thank you, your order was placed'
      end
    end

    context 'entering the incorrect price' do
      it 'raises an error' do
        takeaway.select("bread")
        expect{takeaway.complete_order(1)}
        .to raise_error "Cannot complete order: Incorrect Value"
      end
    end
  end
    
end
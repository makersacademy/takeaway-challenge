require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu, :dishes => {"chicken burger": 3.49, "chicken wings": 4.99}) }
  before(:each) do
    takeaway.instance_variable_set(:@menu, menu)
  end

  describe '#add_to_order' do
    it 'raises an exception if the dish passed is not on the menu' do
      expect{ takeaway.add_to_order("egg fried rice") }.to raise_error("Sorry, that item is not on the menu")
    end
  end

  describe 'Feature tests' do
    describe '#show_menu' do
      it 'shows the list of dishes with prices' do
        expect(takeaway.show_menu).to eq ({ "chicken burger": 3.49, "chicken wings": 4.99})
      end
    end

    describe '#basket_summary' do
      before do
        takeaway.add_to_order("chicken burger")
        takeaway.add_to_order("chicken wings", 2)
      end

      it 'shows the basket summary with totalled up prices' do
        expect(takeaway.basket_summary).to eq "chicken burger x1 = 3.49, chicken wings x2 = 9.98"
      end
    end

    describe '#total' do
      it 'shows the total price of current order' do
        takeaway.add_to_order("chicken wings", 2)
        expect(takeaway.total).to eq 9.98
        takeaway.add_to_order("chicken burger", 3)
        expect(takeaway.total).to eq 20.45
      end
    end
  end
end

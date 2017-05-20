require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  describe 'Feature tests' do
    describe '#show_menu' do
      it 'shows the list of dishes with prices' do
        expect(takeaway.show_menu).to eq ({"quarter chicken": 3.5, "half chicken": 6.0, "whole chicken": 10.50, "small fries": 1.99, "large fries": 2.50})
      end
    end

    describe '#add_to_order' do
      it 'raises an exception if the dish passed is not on the menu' do
        expect{ takeaway.add_to_order("egg fried rice") }.to raise_error("Sorry, that item is not on the menu")
      end
    end
  end
end

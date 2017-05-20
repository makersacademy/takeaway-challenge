require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to(:show_menu) }

  it 'has an empty basket upon instantiation' do
    expect(takeaway.basket).to eq({})
  end

  describe '#add_to_order' do
    it 'adds an item to the basket' do
      takeaway.add_to_order("quarter chicken")
      expect(takeaway.basket).to eq({"quarter chicken": 1})
    end

    it 'adds multiple items to the basket' do
      takeaway.add_to_order("half chicken", 3)
      expect(takeaway.basket).to eq({"half chicken": 3})
    end
  end

  describe 'Feature tests' do
    describe '#show_menu' do
      it 'shows the list of dishes with prices' do
        expect(takeaway.show_menu).to eq ({"quarter chicken": 3.5, "half chicken": 6.0, "whole chicken": 10.50, "small fries": 1.99, "large fries": 2.50})
      end
    end
  end
end

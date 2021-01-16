require 'takeaway_menu'

describe Takeaway do
  describe '#dishes' do
    it 'holds a list of dishes and prices' do
      allow(subject).to receive(:dishes).and_return({ "onion bhaji" => 2.95 })
      expect(subject.dishes).to eq ({ "onion bhaji" => 2.95 })
    end
  end

  describe '#read_menu' do
    it 'reads the menu to the user' do
      expect(subject.read_menu).to eq ({ "onion bhaji" => 2.95, "vegetable samosa" => 2.95,
         "aloo pakora" => 2.95, "chicken tikka" => 3.95, "mixed kebab" => 4.95 })
    end
  end

  describe '#order' do
    it 'will find the item and price' do
      expect(subject.order("onion bhaji")).to eq 'onion bhaji, 2.95'
    end
  end

  describe '#basket' do
    it 'returns an empty basket initially' do
      expect(subject.basket).to eq ({})
    end

    it 'holds the item and price of an ordered item' do
      subject.order("onion bhaji")
      expect(subject.basket).to eq ({ "onion bhaji" => 2.95 })
    end
  end

  describe '#total' do
    it 'returns the total cost of the items in the basket' do
      subject.order("onion bhaji")
      subject.order("vegetable samosa")
      expect(subject.total).to eq 5.9
    end
  end
end

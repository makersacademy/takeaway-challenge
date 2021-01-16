require 'takeaway_menu'

describe Takeaway do

  describe '#read_menu' do
    it 'reads the menu to the user' do
      expect(subject.read_menu).to eq ({ "onion bhaji" => 2.95, "vegetable samosa" => 2.95,
         "aloo pakora" => 2.95, "chicken tikka" => 3.95, "mixed kebab" => 4.95 })
    end
  end

  describe '#order' do
    it 'will find the item and price' do
      expect(subject.order("onion bhaji")).to eq 'onion bhaji, x1'
    end
  end

  describe '#basket' do
    it 'returns an empty basket initially' do
      expect(subject.basket).to eq ({})
    end

    it 'holds the item and quantity of an ordered item' do
      subject.order("onion bhaji", 4)
      expect(subject.basket).to eq ({ "onion bhaji" => 4 })
    end

    it 'allows you to add duplicated items and updates the quantity' do
      subject.order("onion bhaji", 4)
      subject.order("onion bhaji", 4)
      expect(subject.basket).to eq ({ "onion bhaji" => 8 })
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

describe Menu do

  it 'tells you the items on the menu' do
    expect(subject.dishes).to eq ({ "onion bhaji" => 2.95, "vegetable samosa" => 2.95,
    "aloo pakora" => 2.95, "chicken tikka" => 3.95, "mixed kebab" => 4.95 })
  end

  it 'allows you to add items to the menu' do
    expect(subject.add_item("aloo chat", 1.95)).to eq "aloo chat, 1.95"
  end
end

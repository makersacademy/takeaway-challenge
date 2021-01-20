require 'menu'

describe Menu do
  describe '#dishes' do
    it 'tells you the items on the menu' do
      expect(subject.dishes).to eq ({ "onion bhaji" => 2.95, "vegetable samosa" => 2.95,
      "aloo pakora" => 2.95, "chicken tikka" => 3.95, "mixed kebab" => 4.95 })
    end
  end

  describe '#read_menu' do
    it 'reads the menu to the user' do
      expect(subject.read_menu).to eq ({ "onion bhaji" => 2.95, "vegetable samosa" => 2.95,
      "aloo pakora" => 2.95, "chicken tikka" => 3.95, "mixed kebab" => 4.95 })
    end
  end

  describe '#add_item' do
    it 'allows you to add items to the menu' do
      expect(subject.add_item("aloo chat", 1.95)).to eq "aloo chat, 1.95"
    end
  end
end

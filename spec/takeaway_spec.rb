require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }

  let(:menu) { double :menu }
  before(:each) do
    allow(menu).to receive(:dishes).and_return({ "Chicken Korma" => 6.75, "Lamb Bhuna" => 7.25, "Basmati Rice" => 2.00 })
    allow(menu).to receive(:include?).and_return false
  end

  describe '#display_menu' do
    it 'prints out the menu' do
      allow(menu).to receive(:print).and_return Menu::DISHES
      expect(takeaway.display_menu).to eq Menu::DISHES
    end
  end
  describe '#add' do
    it 'adds an item to the order' do
      takeaway.add("Chicken Korma", 1)
      expect(takeaway.order).to eq({ "Chicken Korma" => 1 })
    end

    it 'raises an error if item not on menu' do
      expect { takeaway.add("Beef Vindaloo", 1) }.to raise_error("Item not on menu")
    end
  end
end

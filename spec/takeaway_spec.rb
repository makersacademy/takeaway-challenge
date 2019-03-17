require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }

  let(:menu) { double :menu }
  before(:each) do
    allow(menu).to receive(:dishes).and_return({ "Chicken Korma" => 6.75, "Lamb Bhuna" => 7.25, "Basmati Rice" => 2.00 })
  end

  describe '#display_menu' do
    it 'prints out the menu' do
      allow(menu).to receive(:print).and_return Menu::DISHES
      expect(takeaway.display_menu).to eq Menu::DISHES
    end
  end
end

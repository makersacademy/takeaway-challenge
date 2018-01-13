require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu_class: menu) }
  let(:menu) { double(:menu) }

  describe '#display_menu' do
    it 'displays the menu' do
      allow(menu).to receive(:show).and_return "First item: £price"
      expect(takeaway.display_menu).to eq "First item: £price"
    end
  end

  describe '#choose_item' do
    before do
      allow(menu).to receive(:items).and_return({ 'Pizza' => 1 })
    end
    it 'chooses an item and a quantity to order' do
      takeaway.choose_item('Pizza', 1)
      expect(takeaway.order).to include({ item: 'Pizza', quantity: 1 })
    end

    it 'checks if the item is on the menu' do
      expect{ takeaway.choose_item('exoticfood', 100) }.to raise_error 'Cannot choose this item!'
    end
  end
end

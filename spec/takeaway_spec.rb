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
      allow(menu).to receive(:items).and_return({ 'Pizza' => 1.50 })
    end

    it 'chooses an item and a quantity to order' do
      takeaway.choose_item('Pizza', 1)
      expect(takeaway.order).to include({ 'item' => 'Pizza', 'quantity' => 1, 'price' => 1.5 })
    end

    it 'checks if the item is on the menu' do
      expect { takeaway.choose_item('exoticfood', 100) }.to raise_error 'Cannot choose this item!'
    end
  end

  describe '#view_order' do
    context 'There is nothing to order' do
      it 'raises an error' do
        expect { takeaway.view_order }.to raise_error 'Please select an item first'
      end
    end

    context 'There have been items chosen' do
      before do
        allow(menu).to receive(:items).and_return({ 'Pizza' => 1.50 })
        takeaway.choose_item('Pizza', 1)
      end

      it 'shows the order' do
        expect { takeaway.view_order }.to output("Pizza: 1 @ £1.50\n").to_stdout
      end

      it 'updates the total' do
        expect { takeaway.view_order }.to change { takeaway.total_cost }.by(1.50)
      end
    end
  end
end

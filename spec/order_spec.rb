require 'order'

describe Order do
  let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }
  let(:menu) { double(:menu, new: items) }
  let(:order) { Order.new(menu.new) }

  describe '#choose' do
    it 'lets me choose an item and specify a quantity of 1' do
      expect(order.choose("Margherita", 1)).to eq ["Margherita"]
    end

    it 'lets me choose an item and specify a quantity of 2' do
      expect(order.choose("Margherita", 2)).to eq ["Margherita", "Margherita"]
    end

    it 'should let me choose multiple items from the menu' do
      order.choose("Margherita", 1)
      expect(order.choose("Chorizo", 1)).to eq ["Margherita", "Chorizo"]
    end

    it 'should not allow me to choose items that are not on the menu' do
      expect { order.choose("Toast", 1) }.to raise_exception "This item is not on the menu: choose something else"
    end
  end

  describe '#place_order' do
    context 'when I have chosen what I want' do
      it 'shows the items ordered, and the total cost' do
        order.choose("Roasted Vegetable", 1)
        order.choose("Chorizo", 1)
        expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable and Chorizo. Total due: £21"
      end
      it 'shows the item ordered, and the total cost' do
        order.choose("Roasted Vegetable", 1)
        expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable. Total due: £9"
      end
    end

    before do
      allow(order).to receive(:send_message)
    end
    it 'sends a confirmation message' do
      order.choose("Roasted Vegetable", 1)
      expect(order).to receive(:send_message)
      order.confirm_order
    end
  end
end

require 'order'

describe Order do
  let(:items) { ([{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }]) }
  let(:menu) { double(:menu, new: items) }
  let(:order) { Order.new(menu.new) }


  describe '#choose' do
    it 'lets me choose the item that I want' do
      expect(order.choose("Margherita")).to eq ["Margherita"]
    end

    it 'should let me choose multiple items from the menu' do
      order.choose("Margherita")
      expect(order.choose("Chorizo")).to eq ["Margherita", "Chorizo"]
    end

    it 'should not allow me to choose items that are not on the menu' do
      expect { order.choose("Toast") }.to raise_exception "This item is not on the menu: choose something else"
    end
  end

  describe '#place_order' do
    it 'shows the items you have ordered, and the total cost' do
      order.choose("Roasted Vegetable")
      order.choose("Chorizo")
      expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable and Chorizo. Total due: £21"
    end
    it 'shows the item you have ordered, and the total cost' do
      order.choose("Roasted Vegetable")
      expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable. Total due: £9"
    end
  end
end

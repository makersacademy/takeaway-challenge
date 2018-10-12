require 'order'

describe Order do
  let(:order) { Order.new(menu.show) }
  let(:menu) { double(:menu, show: [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }]) }

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

  describe '#total' do
    it 'should show me the order total and the item that I have ordered' do
      order.choose("Roasted Vegetable")
      expect(order.total).to eq "Total due: £9"
    end

    it 'should show me the order total and the items that I have ordered' do
      order.choose("Margherita")
      order.choose("Chorizo")
      expect(order.total).to eq "Total due: £20"
    end
  end
end

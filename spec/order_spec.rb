require 'order'

describe Order do
  let(:order) { Order.new(menu.show) }
  let(:item) { "Margherita" }
  let(:menu) { double(:menu, show: [{ "Margherita" => "£8" }, { "Roasted Vegetable" => "£9" }, { "Chorizo" => "£12" }]) }

  describe '#choose' do
    it 'let me choose the item that I want' do
      expect(order.choose(["Margherita"])).to eq ["Margherita"]
    end

    it 'should let me choose multiple items from the menu' do
      items = ["Margherita", "Chorizo"]
      expect(order.choose(items)).to eq ["Margherita", "Chorizo"]
    end

    it 'should not allow me to choose items that are not on the menu' do
      expect{ order.choose(["Toast"]) }.to raise_exception "This item is not on the menu: please choose something else"
    end
  end
end

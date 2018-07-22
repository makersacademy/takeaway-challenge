require 'order'

describe Order do
  subject(:order) { described_class.new(:menu)}
  let(:menu)      { double :menu}
  let(:item)      { double :item}

  describe "#add_to_basket" do
    it 'adds dummy item to basket' do
      order.add_to_basket(item)
      expect(order.basket).to eq([item])
    end
  end

  describe "#remove_from_basket" do
    it 'removes dummy item from basket' do
      order.add_to_basket(item)
      order.remove_from_basket(item)
      expect(order.basket).to eq([])
    end
  end

end
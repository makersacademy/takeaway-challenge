require 'item'

describe Item do
  let(:name) { double :name }
  let(:price) { double :price }
  let(:description) { double :description }
  let(:item) { Item.new(name, price, description) }

  describe '#change_item' do
    it 'should be able to change our items' do
      expect(item.change_name(name)).to eq name
    end
  end

  describe '#change_price' do
    it 'should be able to change the price of an item' do
      expect(item.change_price(5)).to eq 5
    end
  end

  describe '#change_describtion' do
    it 'should be able to change the describtion' do
      expect(item.change_description(description)).to eq description
    end
  end
end

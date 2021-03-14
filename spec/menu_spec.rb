require 'menu'
require 'item'

describe Menu do
  let(:lunch) { Menu.new('lunch') }
  let(:item) { double :item }
  let(:name) { double :name }
  let(:price) { double :price }
  let(:description) { double :description }

  it { is_expected.to respond_to :menu }
  it { is_expected.to respond_to :name }

  describe '#add_item' do
    it 'should be able to add items to the menu' do
      expect(lunch.add_item(name, price, description))
    end
  end

  describe '#change_item_name' do
    it 'should be able to change the item name' do
      lunch.add_item(name, price, description)
      lunch.add_item(name, price, description)
      expect(lunch.change_item_name(1, name)).to eq name
    end
  end

  describe '#change_item_price' do
    it 'should be able to change the item price' do
      lunch.add_item(name, price, description)
      lunch.add_item(name, price, description)
      expect(lunch.change_item_price(1, 3)).to eq 3
    end
  end

  describe '#change_item_description' do
    it 'should be able to change the description' do
      lunch.add_item(name, price, description)
      lunch.add_item(name, price, description)
      expect(lunch.change_item_description(1, 'des')). to eq 'des'
    end
  end

  describe '#delete_item' do
    it 'should be able to delete items from the menu' do
      lunch.add_item(name, price, description)
      expect(lunch.delete_item(0)).to eq []
    end
  end

end

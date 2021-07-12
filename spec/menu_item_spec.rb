require 'menu_item'

describe MenuItem do
  let(:name) { double :item_name }
  let(:price) { double :item_price }
  let(:item) { MenuItem.new(:name, :price) }

  it 'the item has a name' do
    expect(item.name).to eq :name
  end
  it 'the item has a price' do
    expect(item.price).to eq :price
  end
end

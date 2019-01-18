require 'item'

describe Item do
  let(:menu_item) { described_class.new("Menu Item", 1) }

  it 'should have a name' do
    expect(menu_item.name).to eq "Menu Item"
  end

  it 'should have a price' do
    expect(menu_item.price).to eq 1
  end
end

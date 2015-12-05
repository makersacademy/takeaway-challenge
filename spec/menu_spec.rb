require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:food) { 'Satay' }
  let(:item) { double :item}


  it 'allows customers to view the menu items' do
    expect{ menu.items }.not_to raise_error
  end

  it 'looks up an item' do
    expect(menu.get_item(food).name).to eq food
  end
end

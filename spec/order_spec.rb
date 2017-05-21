require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu_item) { double :menu_item, name: 'Taco', price: 5 }

  it 'allows customer to start with an empty basket' do
    expect(order.basket).to be_empty
  end

  # it 'adds menu item to basket' do
  #   expect(order.add_item(menu_item)).to eq menu_item
  # end
end

require 'menu'

describe Menu do

  let(:menu) { Menu.new('Wolf Nipple Chips', 0) }

  it 'has a dish' do
    expect(menu.dish).to eq 'Wolf Nipple Chips'
  end

  it 'has dishes with set price' do
    dish = Menu.new('Wolf Nipple Chips', 10)
    expect(dish.price).to eq 10
  end

end
require 'menu'

describe Menu do
  let(:menu){ Menu.new('dumplings',5) }

  it 'has dishes you can choose' do
    expect(menu.dish).to eq('dumplings')
    menu.dish = 'springroll'
    expect(menu.dish).to eq('springroll')
  end

  it 'shows prices of dishes' do
    expect(menu.price).to eq(5)
  end
end
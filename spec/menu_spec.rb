require 'menu'

describe Menu do

  let(:dishes) do
    described_class::DEFAULT_MENU.map { |dish, price| "#{dish.to_s.capitalize}: £#{'%.2f' % price}" }.join(',')
  end

  subject(:menu) { described_class.new } 

  it 'prints a menu with dishes and prices' do
    expect(menu.view_menu).to eq(dishes)
  end

  it 'returns the price of the dish' do
    expect(menu.price(:pita)).to eq described_class::DEFAULT_MENU[:pita]
  end  
end
require 'menu'

describe Menu do
let(:menu) { described_class.new }

  it 'stores menu items and their prices' do
    expect(menu.items).to include(:pizza => 10.00)
    expect(menu.items).to include(:burger => 8.00)
    expect(menu.items).to include(:fried_chicken => 8.50)
  end

  it 'displays menu items and prices to customers' do
    menu.items.each do |item, price|
    expect{menu.display}.to output(/#{item} - #{price}/).to_stdout
  end
  end
end

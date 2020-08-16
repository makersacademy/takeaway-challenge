require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  
  let(:dishes) { {Burger: 9.99, Pizza: 11.99} }

  it 'lists the dishes with the prices' do   
    expect(menu.dishes).to eq(dishes)
  end

  it 'allows user to view the dishes and prices' do
    expect(menu.view).to eq("Burger £9.99, Pizza £11.99")
  end

  it 'checks if a dish is on the menu' do
    expect(menu.has_dish?(:Pizza)).to be true
  end
  it 'checks if a dish is not on the menu' do
    expect(menu.has_dish?(:Curry)).to be false
  end

end
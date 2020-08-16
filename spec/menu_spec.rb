require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  
  let(dishes) { {Burger: 9.99, Pizza: 11.99} }

  it 'lists the dishes with the prices' do
    expect(menu.dishes).to eq(dishes)
  end



end
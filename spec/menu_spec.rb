require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:dish) {"margherita"}
  let(:cost) {4.50}

  it 'stores dishes' do
    expect(menu).to respond_to :dishes
  end

  it 'has prices for each dish' do
    expect(menu.price(dish)). to eq cost
  end
end
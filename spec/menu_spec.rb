require 'menu'

describe Menu do
  let(:dishes) {double :dishes}
  it 'has a list of dishes' do
    menu = described_class.new(dishes)
    expect(menu.dishes).to eq dishes
  end
end

require './lib/menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:dish) { {name: "Dumpling", price: 1.99} }

  describe '#print_dish' do
  it 'prints the dishes' do
    expect(menu.print_dish).to include dish
  end
end
end
require_relative '../lib/menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should show a list of dishes' do
    expect(menu).to respond_to(:show_dishes)
  end

  it 'should list the dishes available' do
    expect(menu.show_dishes).to eq 'Chicken £3.78 | Pasta £4.59 | Salad £2.86'
  end
end

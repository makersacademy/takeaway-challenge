require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: :name, price: :price }

  it 'adds dishes to the menu' do
    menu.add(dish)

    expect(menu.dishes).to include({ name: :price })
  end
end

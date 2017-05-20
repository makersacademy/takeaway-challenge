require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }

  it 'contains dishes' do
    expect(menu.dishes).to eq []
  end

  describe '#add_dish' do
    it 'adds a dish to the dishes list' do
      menu.add_dish(dish)
      expect(menu.dishes).to eq [dish]
    end
  end
end

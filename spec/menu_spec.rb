class Menu
  attr_reader :list

  def initialize
    @list = [Dish.new]
  end

end

class Dish
  attr_reader :price

  def initialize
    @price = 5
  end
end

describe Menu do
  subject(:menu) { described_class.new }

  it 'has a list of items with prices' do
    expect(menu.list.length).to eq 1
    expect(menu.list.first).to be_a Dish
    expect(menu.list.first.price).to eq 5
  end

end

require 'order'

describe Order do
  subject(:order) { described_class.new }
  # let(:menu) { double(:menu) }
  let(:meals) { {'Chicken Tikka' => 2, 'Lamb Biryani' => 1, 'Paneer' => 2} }

describe '#add' do
  it 'adds number of meals' do
    order.add('Chicken Tikka', 2)
    order.add('Lamb Biryani', 1)
    order.add('Paneer', 2)
    expect(order.meals).to eq(meals)
  end

end

end

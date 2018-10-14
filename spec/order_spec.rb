require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:meals) { {'Chicken Tikka' => 2, 'Lamb Biryani' => 1, 'Paneer' => 2} }
  let(:menu) { double(:menu) }

describe '#add' do
  it 'adds number of meals' do
    order.add('Chicken Tikka', 2)
    order.add('Lamb Biryani', 1)
    order.add('Paneer', 2)
    expect(order.meals).to eq(meals)
  end
end

describe '#total' do
  it 'calculates the total cost of the order' do
    allow(menu).to receive(:price).with('Chicken Tikka').and_return(5.25)
    allow(menu).to receive(:price).with('Lamb Biryani').and_return(9.5)
    allow(menu).to receive(:price).with('Paneer').and_return(5.75)
    order.add('Chicken Tikka', 2)
    order.add('Lamb Biryani', 1 )
    order.add('Paneer', 2)
    expect(order.total).to eq(31.50)
 end
end

end

require 'order'

describe Order do

  let(:dish1) { double :dish, name: 'fish', price: 6 }
  let(:dish2) { double :dish, name: 'roast', price: 8 }

  it { is_expected.to respond_to :dishes }

  it 'returns an empty array of dish when creating a new dish' do
    expect(subject.dishes).to eq []
  end

  it 'can have dishes added' do
    subject.add_dish(dish1)
    expect(subject.dishes).to eq [dish1]
  end

  it 'returns the correct total price of the dishes in the order' do
    subject.add_dish(dish1)
    subject.add_dish(dish2)
    expect(subject.total_price).to eq 14
  end

end

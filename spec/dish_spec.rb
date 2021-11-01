require './lib/dish'

describe Dish do
  let(:dish) { Dish.new('Dumpling', 1.99) }

  it 'has a dish name initialized' do
    expect(dish.name).to eq("Dumpling")
  end


  it 'has a price set on initializtion' do
    expect(dish.price).to eq(1.99)
  end
end


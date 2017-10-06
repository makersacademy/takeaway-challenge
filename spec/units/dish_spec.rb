require 'dish'

describe Dish do
  subject(:dish) { described_class.new 'Salad Caprese', 8.5 }
  it 'can be initialized with a name' do
    expect(dish.name).to eq 'Salad Caprese'
  end
  it 'can be initialized with a price' do
    expect(dish.price).to eq 8.5
  end
end

require 'dish'

describe Dish do

  subject(:dish) { described_class.new('Wok-fried greens', 5) }

  it 'should have a name' do
    expect(dish.name).to eq 'Wok-fried greens'
  end

  it 'should have a price' do
    expect(dish.price).to eq 5
  end

  it 'should have a default description of -' do
    expect(dish.description).to eq '-'
  end

end

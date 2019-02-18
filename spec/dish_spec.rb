require 'dish'

describe Dish do
  subject(:dish) { described_class.new('Plantain tacos', 5) }

  it 'should have a name' do
    expect(dish.name).to eq 'Plantain tacos'
  end

  it 'should have a price' do
    expect(dish.price).to eq 5
  end

  it 'should have a default description of -' do
    expect(dish.description).to eq '-'
  end
end

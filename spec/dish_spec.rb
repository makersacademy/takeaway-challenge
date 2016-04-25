require 'dish.rb'
describe Dish do

  subject(:dish) {described_class.new(name: 'Margherita', price: 6.00)}

  it 'should have a name' do
    expect(dish.name).to eq('Margherita')
  end

  it 'should have a price' do
    expect(dish.price).to eq(6.00)
  end
end

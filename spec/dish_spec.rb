require 'dish'

describe Dish do

let(:salad) {double :name}
subject(:dish) {described_class.new(salad,1.50)}


describe '#name' do
  it 'tells you the name of the dish' do
    expect(dish.name).to eq salad
  end
end

describe '#price' do
  it 'tells you the price of the dish' do
    expect(dish.price).to eq 1.50
  end
end

end

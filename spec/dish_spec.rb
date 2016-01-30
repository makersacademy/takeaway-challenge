require 'dish'

describe Dish do

  subject(:dish) {described_class.new('pizza', 3.44)}

  it 'should have a name' do
    expect(dish.name).to eq 'pizza'
  end

  it 'should have a price' do
    expect(dish.price).to eq 3.44
  end

end
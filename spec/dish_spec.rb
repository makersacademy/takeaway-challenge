require 'dish'

describe Dish do

  let(:dish) { Dish.new("Fish Fingers", 4) }

  it 'should have a name' do
    expect(dish.name).to eq("Fish Fingers")
  end

  it 'should have a price' do
    expect(dish.price).to eq 4
  end

end
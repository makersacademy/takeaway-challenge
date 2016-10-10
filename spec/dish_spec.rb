require 'dish'

describe Dish do

  subject(:dish) {described_class.new("Margherita", 5.95)}

  it 'should initialize with name' do
    expect(dish.name).to eq "Margherita"
  end

  it 'should initialize with price' do
    expect(dish.price).to eq 5.95
  end

end

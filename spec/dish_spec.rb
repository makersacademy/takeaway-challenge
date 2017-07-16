require 'dish'

describe Dish do
  subject(:dish) { described_class.new(name, price) }
  let(:name) { "burrito" }
  let(:price) { 8 }

  it 'has a name' do
    expect(dish.name).to eq "burrito"
  end

  it 'has a price' do
    expect(dish.price).to eq 8
  end

  it 'prints name and price as a string' do
    expect(dish.printout).to eq "#{name} - #{price}"
  end

end

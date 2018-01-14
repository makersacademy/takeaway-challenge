require 'dish'

describe Dish do
  let(:name) { double :name }
  let(:price) { double :price }
  it 'requires two arguments' do
    expect { Dish.new(name, price) }.not_to raise_error
  end

end

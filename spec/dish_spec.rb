require 'dish'

describe Dish do
  it 'initialising a new dish requires arguments' do
    expect { Dish.new }.to raise_error(ArgumentError)
  end

  it 'initialising a new dish requires two arguments' do
    expect { Dish.new('pizza', 10) }.to_not raise_error
  end

  before do
    @dish = Dish.new('pizza', 10)
  end

  it 'responds to change_price' do
    expect(@dish).to respond_to(:change_price)
  end

  it 'expects price to be equal to the changed price' do
    expect { @dish.change_price(5) }.to change { @dish.price }.from(10).to(5)
  end
end
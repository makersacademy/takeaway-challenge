require 'dish'

describe Dish do
  let(:dish) { Dish.new("pizza", 7) }

  it 'has a price > 0' do
    expect(dish.price).to be > 0
  end

  it 'has a name' do
    expect(dish.name).not_to be_nil
  end

  it 'returns its name when printed' do
    expect { print dish }.to output("pizza").to_stdout
  end

end

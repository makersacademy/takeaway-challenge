require 'dish'

describe Dish do
  subject(:dish){ Dish.new(:name, :price) }

  it 'stores the dish name' do
    expect(dish.name).to eq :name
  end

  it 'stores the dish price' do
    expect(dish.price).to eq :price
  end

end

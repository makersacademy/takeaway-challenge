require 'dish'

describe Dish do

  let(:dish) { described_class.new(name = "Burger", price = 5.00) }

  it 'has a name' do
    expect(dish.name).to eq("Burger")
  end




end

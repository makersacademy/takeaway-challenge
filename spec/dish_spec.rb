require 'dish'

describe Dish do
  subject(:dish) { described_class.new("Pie", 5) }

  it 'has a name and a price' do
    expect(dish).to have_attributes(name: "Pie", price: 5)
  end
end

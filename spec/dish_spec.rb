require 'dish'

describe Dish do
  subject(:dish) {described_class.new("Lasagna", 5)}

  it 'knows its name' do
    expect(dish.name).to eq "Lasagna"
  end

  it 'knows its price' do
    expect(dish.price).to eq 5
  end

end

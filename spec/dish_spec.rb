require 'dish'

describe "#Dish" do
subject(:dish) {described_class.new(name, price)}
  it 'should create a new dish with the name' do
    dish = Dish.new("Margherita", 8.99)
    expect(dish.name).to eq ("Margherita")
  end

  it 'should create a new dish with the price' do
    dish = Dish.new("Margherita", 8.99)
    expect(dish.price).to eq(8.99)
  end
end

require 'dish'
describe Dish do
  subject(:dish) { described_class }
  let(:name) { double :name }
  let(:price) { double :price }
  it "creates a dish with a name and a price" do
    expect {dish.new(name, price)}.not_to raise_error
  end
  it "can return its name" do
    expect(dish.new(name, price)).to respond_to :name
  end
  it "can return its price" do
    expect(dish.new(name, price)).to respond_to :price
  end
end

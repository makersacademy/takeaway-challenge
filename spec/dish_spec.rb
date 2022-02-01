require_relative '../lib/dish'

describe Dish do

  let(:name) { "Cottage Pie" }
  let(:price) { 8.50 }
  subject(:dish) { described_class.new(name, price) }

  it "can have a name" do
    expect(dish.name).to eq name  
  end

  it "can have a price" do
    expect(dish.price).to eq price
  end

end

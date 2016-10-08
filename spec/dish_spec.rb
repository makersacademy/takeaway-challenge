require 'dish'

describe Dish do

  subject(:dish) {described_class.new("Chicken Teryiaki", 5)}

  it "has a name" do
    expect(dish).to respond_to(:name)
  end
  it "has a price" do
    expect(dish).to respond_to(:price)
  end

end

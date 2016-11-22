require 'dish'

describe Dish do
  name = "Amok"
  price = 3
  subject(:dish) { described_class.new(name,price) }

  it "should initialize with name and price" do
    expect(dish.name).to eq "Amok"
    expect(dish.price).to eq 3
  end

end

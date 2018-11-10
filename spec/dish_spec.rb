require 'dish'

describe Dish do

  let(:dish) {described_class.new("Dish name", 10)}

  it "has a name set at initialization" do
    expect(dish.name).to be_kind_of(String)
  end

  it "has a price set at initialization" do
    expect(dish.price).to be_kind_of(Numeric)
  end

end

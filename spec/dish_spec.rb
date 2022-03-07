require 'dish'

describe Dish do

  let(:subject) { Dish.new("spaghetti bolognese", 12) }

  it "has a name" do
    expect(subject.name).to eq("spaghetti bolognese")
  end

  it "has a price" do
    expect(subject.price).to eq(12)
  end

end

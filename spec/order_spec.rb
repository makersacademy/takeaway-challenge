require 'order'

describe Order do

  let(:food) { double(:food)}
  let(:price) {double(:price)}
  let(:choice) { {food: price} }

  it "responds to the method #add" do
    expect(subject).to respond_to(:add)
  end
  it "stores dishes and prices in a hash when #add is called" do
    subject.add(choice)
    expect(subject.selection).to include(choice)
  end
end

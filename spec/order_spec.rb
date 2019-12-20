require 'order'

describe Order do

  it "creates a new order" do
    expect(subject.ordered_dishes).to be_empty
  end

  it "has a method called total" do
    expect(subject).to respond_to(:total)
  end
end

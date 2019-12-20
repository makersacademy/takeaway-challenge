require 'order'

describe Order do

  it "creates a new order" do
    expect(subject.ordered_dishes).to be_empty
  end

  it "has a method called total" do
    expect(subject).to respond_to(:total)
  end

  it "responds to a method called add_item" do
    expect(subject).to respond_to(:add_item)
  end

  it "allows the customer to add a dish to the order" do
    dish_double = double(:dish)
    subject.add_item(dish_double)
    expect(ordered_dishes).to have_key(dish_double)
  end

  it "shows the total of the order" do

  end
end

require 'order'

describe Order do
  let(:dish) { double(:dish, :menu => [{:Pizza => 8}]) }

  it "should add food to order when adding food" do
    subject.add_order(dish)
    expect(subject.order).to eq([dish])
  end

  it "should raise error when trying to add food if item is not on the menu" do
    subject.add_order(dish)
    expect { subject.order }.not_to raise_error("Item not on the menu")
  end
end
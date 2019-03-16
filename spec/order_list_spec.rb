require 'order_list'

describe OrderList do
  let(:dish) { double :dish }

  it "adds items to an order list" do
    expect(subject.add("Chicken Korma", 1)).to eq "Item added"
  end

  it "checks the last item added includes the item added" do
    subject.add("Chicken Korma", 1)
    expect(subject.check_last).to eq "Chicken Korma - 1"
  end

  it "checks the cost of an item" do
    current_price = 7.95
    subject.add("Chicken Korma", 1)
    allow(dish).to receive(:price) { 7.95 }
    allow(dish).to receive(:description) { "Chicken Korma" }
    expect(subject.calculate_cost([dish])).to eq current_price
  end
end

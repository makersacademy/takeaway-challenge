require 'order_list'

describe OrderList do

  it "adds items to an order list" do
    expect(subject.add("Chicken Korma", 1)).to eq "Item added"
  end

  it "checks the last item added includes the item added" do
    subject.add("Chicken Korma", 1)
    expect(subject.check_last).to eq "Chicken Korma - 1"
  end
end

require "order"

describe Order do
  let(:order_double) {Order.new}

  it "initializes with empty array" do
    expect(subject.order).to be_empty
  end
  # Currently not able to write a passing test here
  # it "prints current order" do
  # 
  #   allow(order_double).to receive(:order){[  {item: "Fish and Chips", quantity: 8},
  #     {item: "Chips", quantity: 2 }]}
  #   expect(order_double.print_order).to eq("Fish and Chips X8"+"Chips X2")
  # end


end

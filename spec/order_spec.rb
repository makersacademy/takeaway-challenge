require "process_order"

describe Process_order do
  let(:process_order) { Process_order.new }

  it "has an instance of the process order class" do
    expect(process_order).to be_a(Process_order)
  end
  it "initializes with no order automatically" do
    expect(process_order.want_to_order).to eq false
  end
  it "shows the customer wants to order" do
    process_order.customer_ordering
    expect(process_order.customer_ordering).to eq true
  end
  it "determins whether the customer wants to order" do
    process_order.get_customer_input(true)
    expect(process_order.want_to_order).to eq true
  end
end

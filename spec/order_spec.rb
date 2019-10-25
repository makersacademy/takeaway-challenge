require "process_order"
describe Process_order do
  let(:process_order) { Process_order.new }

  it "has an instance of the process order class" do
    expect(process_order).to be_a(Process_order)
  end

  it "has a method for checking what the customer wants to do" do
    expect(process_order.get_customer_request).to respond_to(process_order)
  end
end

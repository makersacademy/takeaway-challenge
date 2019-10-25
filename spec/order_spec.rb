require "process_order"
describe Process_order do
  let(:process_order) { Process_order.new }

  it "has an instance of the process order class" do
    expect(process_order).to be_a(Process_order)
  end
end

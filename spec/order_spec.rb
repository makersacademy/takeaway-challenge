require "order"

describe Order do 
    subject(:order) {described_class.new}
    let(:client_order) { Takeaway.new}
    it "check order total agains the menu" do 
        client_order.select(:pizza, 1)
        client_order.select(:pasta, 2)
        total_order = double("test", :check_total => 26)
         expect(order.check_total).to eq (total_order)
    end
end
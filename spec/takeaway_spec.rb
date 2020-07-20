require 'takeaway'

describe Takeaway do
    subject(:takeaway) { described_class.new(menu: menu, order: order) }
    
    let(:menu) { double(:menu, print: print_list) } 
    let(:print_list) { "Here is a list of the dishes" }
    let(:sms) { double("SMS", deliver: nil) }
    let(:order) { double(:order) }

    let(:dishes) { { beef: 2, chicken: 2 } }

    before do
      allow(order).to receive(:add)
end
    it "list of the dishes and their prices on the menu" do
      expect(takeaway.print_list).to eq(print_list)
    end

    it "select some number of of several available dishes" do
        expect(order).to receive(:add).twice
        takeaway.create_order(dishes)
    end


  it "knows the order total" do
    # allow(order).to receive(:add)
    total = takeaway.create_order(dishes)
    expect(total).to eq(10.90)
  end

  it "sends a SMS when order placed" do
    expect(sms).to receive(:deliver)
    takeaway.create_order(dishes)
  end
end
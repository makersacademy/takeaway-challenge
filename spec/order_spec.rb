require 'order'

describe Order do
  let(:new_order) { double('new_order') }
  let(:order) { Order.new(new_order) }

  describe "order" do
    it "contains the selected dishes" do
      my_order = { "Pepperoni Pizza" => 4, "Onion Rings" => 3 }
      allow(new_order).to receive(:new_order).and_return(my_order)
      expect(order.order).to eq({ "Pepperoni Pizza" => 4, "Onion Rings" => 3 })
    end
  end

  describe "#get_total_charge" do
    it "return the total charge for the current order" do
      my_order = [{ "Pepperoni Pizza" => 4 }, { "Onion Rings" => 3 }]
      allow(new_order).to receive(:new_order).and_return(my_order)
      expect(order.total_charge).to eq 7
    end
  end

  describe "#print_order" do
    it "prints the order" do
      my_order = [{ "Pepperoni Pizza" => 4, "Onion Rings" => 3 }]
      allow(new_order).to receive(:new_order).and_return(my_order)
      expect { order.print_order }.to output(<<-output 
Pepperoni Pizza    £4
Onion Rings        £3
----------------------
Total:             £7
      output
      ).to_stdout
    end
  end
end

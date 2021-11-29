require 'order'

describe Order do
  let(:takeaway) { double('new_order_from_takeaway') }
  let(:order) { Order.new(takeaway) }

  describe "order" do
    it "contains the selected dishes" do
      my_order = { "Pepperoni Pizza" => 4, "Onion Rings" => 3 }
      allow(takeaway).to receive(:new_order).and_return(my_order)
      expect(order.order).to eq({ "Pepperoni Pizza" => 4, "Onion Rings" => 3 })
    end
  end

  describe "#total_charge" do
    it "return the total charge for the current order" do
      my_order = [{ "Pepperoni Pizza" => 4 }, { "Onion Rings" => 3 }]
      allow(takeaway).to receive(:new_order).and_return(my_order)
      expect(order.total_charge).to eq 7
    end
  end

  describe "#print_order" do
    it "prints the order" do
      my_order = [{ "Pepperoni Pizza" => 4, "Onion Rings" => 3 }]
      allow(takeaway).to receive(:new_order).and_return(my_order)
      expect { order.print_order }.to output(<<-output 
Pepperoni Pizza    £4
Onion Rings        £3
----------------------
Total:             £7
      output
      ).to_stdout
    end
  end

  describe "#confirm_order?" do
    it "confirms the order" do
      my_order = [{ "Pepperoni Pizza" => 4, "Onion Rings" => 3 }]
      allow(takeaway).to receive(:new_order).and_return(my_order)
      expect { order.confirm_order?("yes") }.to change { order.confirm_order }.to be true
    end
  end
end

require 'bill'

describe Bill do
  describe ".generate_bill" do
    it "should return the total cost of the order with order details" do
      menu = Menu.new
      order = Order.new(menu)
      bill = Bill.new(order, menu)
      order.add_order(1, 2)
      order.add_order(2, 3)
      allow($stdin).to receive(:gets).and_return("continue")
      expect(bill.generate_bill).to eq "--------------------------\ntotal = 75\n--------------------------\n"
    end

  end

  describe ".total_amount" do
    it "return the total cost of the order placed" do
      menu = Menu.new
      order = Order.new(menu)
      bill = Bill.new(order, menu)
      order.add_order(1, 2)
      order.add_order(2, 3)
      expect(bill.total_amount).to eq 75
    end
    
  end

end

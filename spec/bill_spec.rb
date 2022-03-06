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

  # describe ".generate_bill" do
  #   def with_captured_stdout
  #     original_stdout = $stdout
  #     $stdout = StringIO.new
  #     yield
  #     $stdout.string   
  #   ensure
  #     $stdout = original_stdout
  #   end
  #   it "should return the total cost of the order with order details" do
  #     menu = Menu.new
  #     order = Order.new(menu)
  #     bill = Bill.new(order, menu)
  #     order.add_order(1, 2)
  #     order.add_order(2, 3)
  #     allow($stdin).to receive(:gets).and_return("continue")
  #     str = with_captured_stdout { bill.generate_bill }
  #     expect(str).to eq "Vegan Burger --> 2 * 15\nEaling + Chips --> 3 * 15\n-----------------------------------\ntotal = 75\n-----------------------------------\n\nEnter continue if you are happy to proceed with the order:\n"
  #   end

  # end

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

  # describe ".continue_with_the_order?" do
  #   it "should call order_accepted when typed continue" do
  #     allow($stdin).to receive(:gets).and_return("continue")
  #     menu = Menu.new
  #     order = Order.new(menu)
  #     bill = Bill.new(order, menu)
  #     bill.continue_with_the_order?
  #   end

  # end

end

require 'bill'

describe Bill do
  describe ".display_bill" do
    it "should return the total cost of the order with order details" do
      menu = Menu.new
      order = Order.new(menu)
      bill = Bill.new(order, menu)
      order.take_order(1, 2)
      order.take_order(2, 1)
      expect(bill.display_bill).to eq nil
    end

  end

  describe ".display_bill" do
    def with_captured_stdout
      original_stdout = $stdout
      $stdout = StringIO.new
      yield
      $stdout.string   
    ensure
      $stdout = original_stdout
    end
    it "should return the total cost of the order with order details" do
      menu = Menu.new
      order = Order.new(menu)
      bill = Bill.new(order, menu)
      order.take_order(1, 2)
      order.take_order(2, 1)
      str = with_captured_stdout { bill.display_bill }
      expect(str).to eq "Vegan Burger --> 2 * 15\nEaling + Chips --> 1 * 15\n-----------------------------------\ntotal = 45\n"
    end

  end

  describe ".total_amount" do
    it "return the total cost of the order placed" do
      menu = Menu.new
      order = Order.new(menu)
      bill = Bill.new(order, menu)
      order.take_order(1, 2)
      order.take_order(2, 1)
      expect(bill.total_amount).to eq 45
    end
  end


end

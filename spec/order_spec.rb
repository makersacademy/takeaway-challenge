require 'order'

describe Order do
  it "should be able to create and instance of Menu" do
    expect(Order).to respond_to(:new)
  end

  describe "#add_item" do
    it 'should respond to add_item' do
      expect(Order.new).to respond_to(:add_items)
    end

    it 'should add an item' do
      order = Order.new
      order.add_items(1)
      expect(order.order).to eq([{ "Margherita Pizza" => 8 }])
    end
  end

  describe "#check order" do
    it "should respond to check_order" do
      expect(Order.new).to respond_to(:check_order)
    end

    it "check_order should print order" do
      order = Order.new
      order.add_items(1)
      order.check_order
      expect(order.total).to eq(8)
    end
  end

  describe "#submit_and_confirm" do
    it "should respond to check_order" do
      expect(Order.new).to respond_to(:submit_and_confirm)
    end

    it "should raise and error if no itmes has been addded to the order" do
      order = Order.new
      expect { order.submit_and_confirm }.to raise_error("Your order is empty")
    end
  end
end

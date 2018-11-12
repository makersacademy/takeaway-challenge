require 'order'

describe Order do
  attr_reader :menu_double, :foo
  before(:each) do
    @menu_double = double :menu, items: { "foo" => 1 }
    @foo = Order.new(menu_double)
  end
  describe "#order" do
    it "should start out empty" do
      expect(foo.order).to be_empty
    end
  end
  describe "#add" do
    it "should add an item to an order" do
      foo.add("foo", 1)
      expect(foo.order.last).to eq({ item: "foo", num: 1 })
    end
    it "should add multiple items to an order" do
      foo.add("foo", 1)
      foo.add("foo", 2)
      expect(foo.order).to eq([{ item: "foo", num: 1 }, { item: "foo", num: 2 }])
    end
  end
  describe "#check" do
    it "should show a message if totals match" do
      expect { foo.check(0) }.to output("Our totals match.\n").to_stdout
    end
    it "should raise an error if totals don't match" do
      expect { foo.check(1) }.to raise_error "Your total does not match ours."
    end
  end
  describe "#checkout" do
    it "should return the message sid once a message is sent" do
      message_double = double :message, send: "SM123456ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      expect(foo.checkout("", message_double)).to start_with("SM")
      expect(foo.checkout("", message_double)).to have_attributes(length: 34)
    end
  end
  describe "#show" do
    it "should show an itemised list of the customer's order" do
      foo.order << { item: "foo", num: 1 }
      expect { foo.show(1) }.to output("             Your Order
------------------------------------
1 x foo                        £1.00
------------------------------------
Total:                         £1.00\n\n").to_stdout
    end
  end
end

require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(menu, order_log)}
  let(:menu) { double :menu }
  let(:order_log) { double :order_log }
  let(:dish1) {double :dish}
  let(:dish2) {double :dish}

  before(:each) do
    allow(menu).to receive(:get_menu) { {1012 => dish1, 1013 => dish2} }
    allow(order_log).to receive(:total) {[5.97, 4.22]}
    allow(order_log).to receive(:add_item)
    allow(order_log).to receive(:start_order)
    allow(dish1).to receive(:name) {"Pizza"}
    allow(dish1).to receive(:price) {1.99}
    allow(dish2).to receive(:name) {"Burger"}
    allow(dish2).to receive(:price) {2.11}
  end


  describe "#start_order" do
    it "calls the start_order method on the order_log" do
      expect(order_log).to receive(:start_order)
      restaurant.start_order
    end
  end

  describe "#show_menu" do
    it "calls the the #get_menu on Menu" do
      expect(menu).to receive(:get_menu)
      restaurant.show_menu
    end
  end

  describe "#add_item" do
    it "passes the item to the order log" do
      expect(order_log).to receive(:add_item).with(dish1, 2)
      restaurant.add_item(1012, 2)
    end

    it "raises error if quantity is less than 1" do
      expect{restaurant.add_item(1012, 0)}.to raise_error(RuntimeError)
    end

    it "raises error if the quantity is not a fixnum" do
      expect{restaurant.add_item(1013, 3.5)}.to raise_error(RuntimeError)
    end

    it "raises error if dish is not available" do
      expect{restaurant.add_item(9999, 2)}.to raise_error(RuntimeError)
    end
  end

  describe "#order_summary" do
    it "calls order_summary on the order log" do
      expect(order_log).to receive(:order_summary)
      restaurant.order_summary
    end
  end

  describe "#total" do

    it "calls total method on order log" do
      expect(order_log).to receive(:total)
      restaurant.total
    end

    it "returns the sum of the current order" do
      restaurant.add_item(1012, 3)
      restaurant.add_item(1013, 2)
      expect(restaurant.total).to eq 10.19
    end
  end

  describe "#checkout" do
    it "passes the checkout value to the order_log" do
      expect(order_log).to receive(:checkout_order).with(11.11)
      restaurant.checkout(11.11)
    end
  end

  describe "#send_text_message" do
    it "do something"
  end

end

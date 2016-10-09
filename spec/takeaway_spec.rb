require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe "#show_menu" do
    context "when called" do
      it "calls menu.print" do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

  it { is_expected.to respond_to(:order).with(2).argument}

  describe "#show_order" do
    context "when called" do
      it "outputs a list of items in the order_list array" do
        expect(takeaway.show_order).to eq takeaway.order_system.order_list
      end
    end
  end

  describe "#show_total" do
    context "when called" do
      it "outputs a sum of each order item" do
        expect(takeaway.show_total).to eq nil
      end
    end
  end

  describe "#confirm" do
    context "when given an incorrect amount" do
      it "raises an error" do
        item = takeaway.menu.list.first[0]
        takeaway.order(item, 1)
        expect{takeaway.confirm(0.01)}.to raise_error "Does not match total, order not placed"
      end
    end
  end

end

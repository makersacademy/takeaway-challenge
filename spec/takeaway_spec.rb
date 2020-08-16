require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, :price => 1.99 }
  let(:order) { double :order }

  subject { described_class.new(menu, order) }

  it "has a menu" do
    expect(subject.menu).to eq(menu)
  end

  it "has an order" do
    expect(subject.order).to eq(order)
  end

  describe "#view_menu" do
    it "returns @menu.view" do
      expect(menu).to receive(:view)
      subject.view_menu
    end
  end

  describe "#add_item" do
    it "calls @order.add when item is on menu" do
      allow(menu).to receive(:on_menu?) { true }
      expect(order).to receive(:add).with("spring rolls", 1, 1.99)
      subject.add_item("spring rolls", 1)
    end

    it "notifies user if trying to add an item not on the menu" do
      allow(menu).to receive(:on_menu?) { false }
      expect(subject.add_item("pizza")).to eq("Item not on menu")
    end
  end

  describe "#view_order" do
    it "returns @order.view" do
      expect(order).to receive(:view)
      subject.view_order
    end
  end

  describe "#order_total" do
    it "uses @order.total" do
      expect(order).to receive(:total)
      subject.order_total
    end

    it "returns a confirmation text" do
      allow(order).to receive(:total) { 6.97 }
      expect(subject.order_total).to eq("Your order total is £6.97")
    end
  end

  describe "confirm_order" do
    it "notifies user if price is not the same" do
      expect(subject.confirm_order(100)).to eq("Incorrect amount, please try again")
    end
  end
end

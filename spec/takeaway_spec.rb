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

    it "raises error if trying to add an item not on the menu" do
      allow(menu).to receive(:on_menu?) { false }
      expect { subject.add_item("pizza") }.to raise_error("Item not on menu")
    end
  end
end

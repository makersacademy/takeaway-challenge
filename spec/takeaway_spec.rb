require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it { is_expected.to respond_to(:order).with(2).argument}

  describe "#show_menu" do
    context "Shows the menu list" do
      it "access the #menu.print" do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

  describe "#show_order" do
    context "Shows the order" do
      it "outputs a list of items in the order_list " do
        expect(takeaway.show_order).to eq takeaway.order_system.order_list
      end
    end
  end

  describe "#show_total" do
    context "when called shows the total of order" do
      it "outputs a sum of each order item" do
        expect(takeaway.show_total).to eq nil
      end
    end
  end

  describe "#confirm" do
    before :each do
      @item = takeaway.menu.list.first
      takeaway.order(@item[0], 1)
    end

    context "if an incorrect amount is given" do
      it "raises an error" do
        expect{takeaway.confirm(0.01)}.to raise_error "Order was not placed because doesn't match the total."
      end
    end
  end
end

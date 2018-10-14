require "takeaway"

describe Takeaway do

  subject { Takeaway.new(menu, format, order, price) }
  let(:menu) { double :menu, items: [{dish: "burger", price: 4}] }
  let(:format) { double :format, format_menu: "Burger - £4.00"}
  let(:order) { double :order, add_to_order: "burger x2" }
  let(:price) { double :price }

  describe '#show_menu' do

    it "should show dishes and prices" do
      expect(format).to receive(:format_menu)
      expect(menu).to receive(:items)
      subject.show_menu
    end

  end

  describe '#add_to_order' do

    it "should add dish and quantity to order" do
      expect(order).to receive(:add_to_order).with("burger", 2)
      subject.add_to_order("burger", 2)
    end

  end

end

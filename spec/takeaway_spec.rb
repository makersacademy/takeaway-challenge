require "takeaway"

describe Takeaway do

  subject { Takeaway.new(menu, format, order, price, contact) }
  let(:menu) { double :menu, items: [{dish: "burger", price: 4}] }
  let(:format) { double :format, format_menu: "Burger - £4.00"}
  let(:order) { double :order, add_to_order: "burger x2" }
  let(:price) { double :price, total: 5.00 }
  let(:contact) { double :customercontact, send_message: "sent" }

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

  describe '#print_order' do

    it "should print out order" do
      expect(order).to receive(:format_order)
      subject.print_order
    end

  end

  describe '#finish_order' do

    it "should finish order and calculate total" do
      expect(price).to receive(:total) {"£5.00"}
      allow(order).to receive(:order)
      allow(contact).to receive(:send_message)
      subject.finish_order
    end

    it "should finish order and send message" do
      allow(price).to receive(:total)
      allow(order).to receive(:order)
      expect(contact).to receive(:send_message)
      subject.finish_order
    end

  end

end

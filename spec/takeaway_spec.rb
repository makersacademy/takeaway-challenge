require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:text) { double :text }
  let(:text_class) { double(:text_class, new: text) }
  # let(:order_class) { double(:order_class, new: menu)}
  subject { described_class.new(menu) }

  describe '#show_menu' do
    it "should print the menu out to the STDOUT" do
      allow(menu).to receive(:view) { puts "1.  Sweet & Sour Chicken Balls    5.99\n" }
      expect { subject.show_menu }.to output("1.  Sweet & Sour Chicken Balls    5.99\n").to_stdout
    end
  end

  describe '#submit_order' do
    it "should raise an error if the correct amount is not tendered" do
      allow(order).to receive(:total) { 12.99 }
      expect { subject.submit_order(order, 8.69, text_class) }.to raise_error "Incorrect amount tendered, order not successful"
    end

    it "should add the order to the order history if the correct amount tendered" do
      allow(order).to receive(:total) { 12.99 }
      subject.submit_order(order, 12.99, text_class)
      expect(subject.order_history).to include(order)
    end
  end
end 

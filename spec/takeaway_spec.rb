require 'takeaway'
require 'order'
require 'sms'

describe Takeaway do

  let(:order) { Order.new }

  describe '#check_menu' do
    it "displays the menu" do
      expect { subject.check_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it "adds to order" do
      expect(subject.add_to_order("noodles", 2)).to eq(order.add("noodles", 2))
    end
  end

  describe '#summary' do
    it "displays the current order" do
      expect(subject.summary).to eq(order.summary)
    end
  end

  describe '#total' do
    it "pretty prints the total" do
      expect(subject.total).to eq("total - £#{order.total}")
    end
  end

  describe '#place_order' do
    it "raises error if given total is different from order total" do
      expect { subject.place_order(-1) }.to raise_error("given total is incorrect")
    end
  end

end

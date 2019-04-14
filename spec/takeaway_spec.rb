require 'takeaway'
require 'order' # needs doubles to make use of dependency injection

describe Takeaway do

  let(:takeaway) { described_class.new }
  let(:order) { Order.new }

  describe '#check_menu' do
    it "displays the menu" do
      expect { takeaway.check_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it "adds items and quantities to order" do
      expect(takeaway.add_to_order("noodles", 2)).to eq(order.add("noodles", 2))
    end
  end

  describe '#summary' do
    it "displays summary of order" do
      expect(takeaway.summary).to eq(order.summary)
    end
  end

  describe '#total' do
    it "pretty prints the order total" do
      expect(takeaway.total).to eq("total - £#{order.total}")
    end
  end

  describe '#place_order' do
    it "raises error if given total is different from order total" do
      expect { takeaway.place_order(-1) }.to raise_error("given total is incorrect")
    end

    it "unit tests send_sms" do # needs description
      # needs test
    end
  end

end

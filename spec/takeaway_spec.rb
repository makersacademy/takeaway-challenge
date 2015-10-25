require "takeaway"

describe Takeaway do

  let(:subject)   { Takeaway.new( "13", order, txt) }
  let(:order)     { double(:order) }
  let(:txt)       { double(:order) }
  let(:num)       { "13" }
  let(:name)      { "oooh" }
  let(:order_1)   { ["dohnuts", 4] }
  let(:menu_1)    { {dohnuts: 4, potatoes: 9} }
  let(:log)       { {dohnuts: 8} }
  let(:msg)       { "Current order: #{log}, Current total: 2" }

  before(:each) do
    allow(order).to receive(:add_to).and_return(order_1)
    allow(order).to receive(:order_log).and_return(log)
    allow(order).to receive(:total).and_return(2)
    allow(order).to receive(:menu).and_return(menu_1)
    allow(txt).to receive(:call).and_return(num)
  end

  describe "#initialize" do
    it "has a phone number, with a default" do
      expect(subject.number).to eq num
    end
  end

  describe "ordering" do
    it "places a new order" do
      expect(subject.add("dohnuts", 4)).to eq msg
    end

    it "raises an error when wrong food is entered" do
      expect(subject.add("DESPAIR", 5)).to raise_error(ArgumentError, "try again")
    end
  end

  describe "multiple orders, and checkout" do

    before(:each) do
      2.times { subject.add("dohnuts", 2) }
    end

    it "shows the current order and current total" do
      expect(subject.current_order).to eq msg
    end

    it "sends a message on checkout with the full order" do
      expect(subject.checkout).to eq num
    end
  end

end

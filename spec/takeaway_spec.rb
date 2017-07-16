require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(orderdouble) }
    let(:orderdouble) { double(:order, order: nil) }
    let(:sampleorder) { 'Gimlet' }
    let(:errororder) { 'Banana' }
    let(:sampleamount) { 1 }

  describe "menu" do
    it "responds to #menu method" do
      expect(takeaway).to respond_to(:menu)
    end

    it "prints the menu with the #print_menu method" do
      expect { takeaway.print_menu } .to output.to_stdout
    end
  end

  describe "#order" do
    it "delegates to the order object" do
      expect(orderdouble).to receive(:order)
      subject.order(sampleorder, sampleamount)
    end

    it "raises an error if item doesn't exist is menu" do
      expect { takeaway.order(errororder, sampleamount) }.to raise_error "Item unavailable"
    end
  end

  describe "#basket" do
    it "responds to #basket method" do
      expect(takeaway).to respond_to(:basket)
    end

    it "delegates to the order object" do
      expect(orderdouble).to receive(:basket)
      subject.basket
    end
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(takeaway).to respond_to(:checkout)
    end

    it "delegates to the order object" do
      expect(orderdouble).to receive(:checkout)
      subject.checkout
    end
  end
end

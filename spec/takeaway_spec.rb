require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(orderdouble) }
    let(:orderdouble) { double(:order, order: [nil], basket: []) }
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
      takeaway.order(sampleorder, sampleamount)
    end

    it "raises an error if item doesn't exist is menu" do
      expect { takeaway.order(errororder, sampleamount) }.to raise_error "Item unavailable"
    end
  end

  describe "#basket" do
    it "responds to #basket method" do
      allow(orderdouble).to receive(:basket) { ['gimlet'] }
      expect(takeaway.basket).to eq ["gimlet"]
    end

    it "delegates to the order object" do
      takeaway.order(sampleorder, sampleamount)
      expect(takeaway).to respond_to(:basket)
    end

    it "raises an error if the basket is empty" do
      expect(orderdouble).to receive(:basket)
        expect { takeaway.basket }.to raise_error "Basket is empty!"
    end
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(takeaway).to respond_to(:checkout)
    end

    it "delegates to the order object" do
      expect(orderdouble).to receive(:checkout)
      takeaway.checkout(0)
    end
  end
end

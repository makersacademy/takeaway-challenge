require 'takeaway'

describe Takeaway do
  let(:items) { [ {name: "Chips", price: 2}, {name: "Curry", price: 3.25 } ] }
  let(:selection) { [ { name: "Chips", quantity: 2} ] }
  let(:printer) { double(:printer) }
  let(:printer_class) { double(:printer, new: printer) }
  let(:takeaway) { Takeaway.new(items, printer_class) }
  let(:basket) { double(:basket, print_invoice: nil) }
  let(:basket_class) { double(:basket_class, new: basket) }

  context "on creation" do
    it "has a printer" do
      expect(printer_class).to receive(:new)
      takeaway
    end

    it "stores a list of items" do
      expect(takeaway.items).to eq items
    end
  end

  describe "#make_selection" do
    it "checks if selection is array" do
      expect { takeaway.make_selection(  { name: "Chips", quantity: 2 }, basket_class) }.to raise_error "selection must be array"
    end
    it "checks if selection has quantity" do
      expect { takeaway.validate_selection( [{ name: "Chips" }]) }.to raise_error "each item must have quantity"
    end
    it "checks if items are available" do
      expect { takeaway.validate_selection( [{ name: "Spuds", quantity: 2 }] ) }.to raise_error "not all items available"
    end

    it "makes a new basket printer instance" do
      expect(basket_class).to receive(:new).with(selection, takeaway.items)
      takeaway.make_selection(selection, basket_class)
    end

    it "asks basket printer to print invoice" do
      expect(basket).to receive(:print_invoice)
      takeaway.make_selection(selection, basket_class)
    end

  end
  describe "#show_items" do
    it "gives printer it's list of items and asks to print them" do
      expect(printer).to receive(:print_items).with(takeaway.items)
      takeaway.show_items
    end
  end
end

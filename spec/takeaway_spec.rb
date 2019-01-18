require 'takeaway'

describe Takeaway do
  let(:items) {{chips: 2, curry: 3.25}}
  let(:selection) {{chips: 2}}
  let(:printer) {double(:printer)}
  let(:printer_class) {double(:printer, new: printer)}
  let(:takeaway) {Takeaway.new(printer_class, items)}
  let(:basket_printer_class) {double(:basket_printer_class, new: nil)}

  context "on creation" do
    it "has a printer" do
      expect(printer_class).to receive(:new)
      takeaway
    end

    it "stores a list of items" do
      expect(takeaway.items).to eq (items)
    end
  end

  describe "#make_selection" do
    it "checks if selection is hash" do
      expect{takeaway.make_selection([{chips: 2}], basket_printer_class)}.to raise_error "selection must be hash"
    end
    it "checks if selection has quantity" do
      expect{takeaway.validate_selection({chips: "string"})}.to raise_error "each item must have quantity"
    end
    it "checks if selection has quantity" do
      expect{takeaway.validate_selection({spuds: 2})}.to raise_error "not all items available"
    end

    it "makes a new basket printer class" do
      expect(basket_printer_class).to receive(:new).with(selection, takeaway.items)
      takeaway.make_selection(selection, basket_printer_class)
    end

  end
  describe "#show_items" do
    it "gives printer it's list of items and asks to print them" do
      expect(printer).to receive(:print_items).with(takeaway.items)
      takeaway.show_items
    end
  end
end

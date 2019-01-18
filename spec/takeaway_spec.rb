require 'takeaway'

describe Takeaway do

  let(:no_name_item) {{price: 2}}
  let(:no_price_item) {{name: 'chips'}}
  let(:chips) {{name: 'chips', price: 2}}
  let(:curry) {{name: 'curry', price: 3.25}}
  let(:chips_and_curry) {[chips, curry]}
  let(:printer) {double(:printer)}
  let(:printer_class) {double(:printer, new: printer)}
  let(:takeaway) {Takeaway.new(printer_class)}
  context "on creation" do
    it "has a printer" do
      expect(printer_class).to receive(:new)
      takeaway
    end
  end
  describe "#add_item" do
    it "only adds items with names" do
      expect{takeaway.add_item(no_name_item)}.to raise_error "must have item name"
    end
    it "only add items with prices" do
      expect{takeaway.add_item(no_price_item)}.to raise_error "must have item price"
    end
    it "stores a list of items" do
      takeaway.add_item(chips)
      takeaway.add_item(curry)
      expect(takeaway.items).to eq [chips, curry]
    end
  end
  describe "#show_items" do
    it "gives printer it's list of items and asks to print them" do
      expect(printer).to receive(:display_items).with(takeaway.items)
      takeaway.show_items
    end
  end
end

=begin
"ITEMS"
currently takeaway is:
adding items to it's list
checking if the items are valid
storing the items

"DISPLAY"
formatting price of items
printing the items



=end

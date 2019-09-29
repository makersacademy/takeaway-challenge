require 'order'

describe Order do

  let(:item) { double :item }
  let(:menu_dub) { double :a_menu }

  describe "#initialize" do
    it "initializes with an empty list to store user order" do
      expect(subject.basket).to be_empty
    end
  end

  describe "#add_to_basket" do
    it "adds selected item and quantity to order_list" do
      subject.add_to_basket(item, 4)
      expect(subject.basket).to include({ item => 4 })
    end
  end

  describe "#order_summary" do
    let(:summary) { "2 x calzone = £25.0, 2 x diavola = £21.0" }
    it "returns a string of items 'quantity x dish = total item price'" do
      subject.add_to_basket('calzone', 2)
      subject.add_to_basket('diavola', 2)
      expect(subject.order_summary).to eq summary
    end
  end

  describe "#order_total" do
    it "returns total price of order" do
      subject.add_to_basket('calzone', 3)
      subject.add_to_basket('diavola', 2)
      expect(subject.order_total).to eq 58.50
    end
  end
end

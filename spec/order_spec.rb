require 'order'

describe Order do

  menu_items = [{"Chicken burger" => 10}, {"Vegan Soup" => 5}, { "Chang Beer" => 3}]

  let(:menu) { double(:menu) }
  let(:customer_selection) {(2)}
  let(:customer_selection_2) {(1)}

  describe "#initialize" do
    it "returns empty array" do
      expect(subject.items_ordered).to eq []
    end
    # another test for the menu instance variable
  end

  describe "#add_item" do
    before do
      allow(menu).to receive(:items).and_return(menu_items)
    end
    it "adds item to items_ordered" do
      expect{ subject.add_item(menu, customer_selection) }.to change {subject.items_ordered.length}.by(1)
    end

    it "adds correct price to the order" do
      subject.add_item(menu, customer_selection)
      expect(subject.items_ordered.first["Vegan Soup"]).to eq (5)
    end
  end

  describe "#order_value" do
    it "correctly calculates order value" do
      allow(menu).to receive(:items).and_return(menu_items)
      subject.add_item(menu, customer_selection)
      subject.add_item(menu, customer_selection_2)
      expect {subject.value}.to output(/#{Regexp.quote("£15")}/).to_stdout
    end
  end

  describe "#items_ordered" do
    it "includes items that have been ordered" do
      allow(menu).to receive(:items).and_return(menu_items)
      subject.add_item(menu, customer_selection)
      subject.add_item(menu, customer_selection_2)
      expect {subject.items}.to output(/#{Regexp.quote("Vegan Soup")}/).to_stdout
    end
  end
end
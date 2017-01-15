require "printer"

describe Printer do
  let(:menu_item) do
    double :menu_item,
    name: "name!",
    description: "description!",
    price: 555
  end
  let(:menu_item2) do
    double :menu_item,
    name: "thing",
    description: "describe me",
    price: 222
  end
  let(:menu_class){double :menu_class,items: [menu_item,menu_item2]}
  describe "printing a list of the menu items" do
    it "prints an individual_item" do
      desired_result =
        "1. name!                description!                             £5.55"
      expect(subject.item_to_string(menu_item, 1)).to eq desired_result
    end
  end
  describe "prints the full list of items" do
    before(:each){subject.to_string menu_class}

    it "prints item one" do
      expect(menu_item).to have_received :name
    end
    it "prints item two" do
      expect(menu_item2).to have_received :name
    end
  end
end

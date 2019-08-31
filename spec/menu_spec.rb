require "menu_list"

describe MenuList do
  let(:dish) { double :dish }

  context "when starting empty" do
    it "empty dishes array" do
      expect(subject.dishes).to eq([])
    end
    it "adds a single item to the menu" do
      subject.add_item("random1",dish)
      expect(subject.dishes).to eq([{id: "random1", dish: dish}])
    end
  end
end

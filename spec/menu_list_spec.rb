require "menu_list"

describe MenuList do
  let(:dish) { double }
  let(:dish2) { double }

  context "when starting empty" do
    it "empty dishes array" do
      expect(subject.dishes).to eq([])
    end
    it "adds a single item to the menu" do
      subject.add_item("random1", dish)
      expect(subject.dishes).to eq([{ id: "random1", dish: dish }])
    end
    it "loads a menu with a set of dishes" do
      subject.load_menu
      expect(subject.dishes.size).to be(10)
    end
  end
  context "menu full of dishes" do
    it "returns array of available dishes" do
      allow(dish).to receive(:available?).and_return(true)
      expected_array = []
      for i in 1..5 do
        subject.add_item("random#{i}", dish)
        expected_array << { id: "random#{i}", dish: dish }
      end
      expect(subject.available_dishes).to eq(expected_array)
    end
    it "returns the one available dish" do
      allow(dish).to receive(:available?).and_return(true)
      allow(dish2).to receive(:available?).and_return(false)
      subject.add_item("TrueDish", dish)
      subject.add_item("FalseDish", dish2)
      expect(subject.available_dishes).to eq([{ id: "TrueDish", dish: dish }])
    end
    it "returns a formatted list of dishes" do
      allow(dish).to receive(:available?).and_return(true)
      allow(dish).to receive(:describe).and_return("1. Chicken - £10.99")
      subject.add_item(1, dish)
      expect(subject.display_menu).to eq("1. Chicken - £10.99\n")
    end
  end
end

require "menu_list"

describe MenuList do
  let(:dish) { double }
  let(:dish2) { double }

  context "when starting empty" do
    it "empty dishes array" do
      expect(subject.dishes).to eq([])
    end
    it "adds a single item to the menu" do
      subject.add_item(dish)
      expect(subject.dishes).to eq([dish])
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
      5.times do
        subject.add_item(dish)
        expected_array << dish
      end
      expect(subject.available_dishes).to eq(expected_array)
    end
    it "returns the one available dish" do
      allow(dish).to receive(:available?).and_return(true)
      allow(dish2).to receive(:available?).and_return(false)
      subject.add_item(dish)
      subject.add_item(dish2)
      expect(subject.available_dishes).to eq([dish])
    end
    it "returns a formatted list of dishes" do
      allow(dish).to receive(:available?).and_return(true)
      allow(dish).to receive(:describe).and_return("1. Chicken - £10.99")
      subject.add_item(dish)
      expect(subject.display_menu).to eq("1. Chicken - £10.99\n")
    end

    it "returns dish 1 when passed 1" do
      subject.load_menu
      expect(subject.return_dish(1)).to eq(subject.dishes[0])
    end
  end
end
